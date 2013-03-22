#-----------------------------------------------------------------------------
# C++ Plugin for Vim Intellisense.                                               
# Author    : Madhan Ganesh                                                   
# Dated     : August 21st 2004                                                
# Version   : cppft 1.0                                                       
#                                                                          
# You can modify the source, provided you leave this header information.
#-----------------------------------------------------------------------------
 
use Logger;

#-----------------------------------------------------------------------------
# This calss is designed to abstract a include file name container. This is a
# singleton class where various classes can get the next available file name and
# can also keep adding to the queue. 
#
#                            IncludeFileQueue    
#                   ---------------------------     
#                   O O O O O O .....   (include files)             
#                   ---------------------------
#      (getNextAvailableFileName)    (reset)       (addIncludeFileName)
#
#
#      Usage:
#      ======             
#                         
#      IncludeFileQueue queue = IncludeFileQueue->getIFQueue();
#      queue->reset();    
#      searchPattern(queue);
#                         
#                         
#     Note:               
#     =====               
#       *) The SearchPatern routine, can get the nextAvailableFileName to perform the
#          search.        
#                         
#       *) While searching if it encounters a #include file. It again adds the same
#          in to the queue.
#                         
package IncludeFileQueue; 
{                         
    sub new                    
    {                          
        my $class = shift;     
        my $self = {
            m_pos => undef,
            m_queue => []            
        };         
        bless $self,$class;
        return $self;         
    }                         
                              
    sub begin                 
    {                         
        my ($self) = @_;   
        $self->{m_pos} = 0;
    }                      
                           
    sub getNextSearchFile  
    {                      
        my ($self) = @_;   
        my @queue = @{$self->{m_queue}}; 
        my $len = @queue;
        my $ret = undef;
        my $pos = $self->{m_pos};
        if ($pos < $len)
        {           
            $ret = $queue[$pos];
            $self->{m_pos} = $pos + 1;
        }           
        return $ret;
    }                                 
                                      
    sub addSearchFile                 
    {                                 
        my ($self,$toadd) = @_;       
        my $queue = \@{$self->{m_queue}};
        my $exists = 0;
        for (@$queue)
        {
            if ($_ eq $toadd)
            {
                $exists = 1;
                last;
            }
        }

        if (!$exists)
        {
            push(@$queue,$toadd);
        }                 
    }                     
                          
    # singleton instance of IFQ.
    my $sm_ifq = undef;
        
    sub getIFQueue             
    {                          
        if (!defined($sm_ifq))
        {                 
            $sm_ifq = new IncludeFileQueue;
        }                                 
        return $sm_ifq;    
    }                          
}                         
1;                         
