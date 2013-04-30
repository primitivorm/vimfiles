Examples

div expands to:

<div></div>

div#header expands to:

    <div id="header"></div>

div.align-left#header expands to:

    <div id="header" class="align-left"></div>

div#header + div#footer expands to:

    <div id="header"></div>
    <div id="footer"></div>

#menu > ul expands to:

    <div id="menu">
        <ul></ul>
    </div>

#menu > h3 + ul expands to:

    <div id="menu">
        <h3></h3>
        <ul></ul>
    </div>

#header > h1{Welcome to our site} expands to:

    <div id="header">
        <h1>Welcome to our site</h1>
    </div>

a[href=index.html]{Home} expands to:

    <a href="index.html">Home</a>

ul > li*3 expands to:

    <ul>
        <li></li>
        <li></li>
        <li></li>
    </ul>

ul > li.item-$*3 expands to:

    <ul>
        <li class="item-1"></li>
        <li class="item-2"></li>
        <li class="item-3"></li>
    </ul>

ul > li.item-$*3 > strong expands to:

    <ul>
        <li class="item-1"><strong></strong></li>
        <li class="item-2"><strong></strong></li>
        <li class="item-3"><strong></strong></li>
    </ul>

table > tr*2 > td.name + td*3 expands to:

    <table>
        <tr>
            <td class="name"></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="name"></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>

#header > ul > li < p{Footer} expands to:

    <!-- The < symbol goes back up the parent; i.e., the opposite of >. -->
    <div id="header">
        <ul>
            <li></li>
        </ul>
        <p>Footer</p>
    </div>

