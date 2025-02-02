#!/bin/bash

# This generates the KEYS keyring file with the Node.js release team's gpg
# keys.

set -e

#Keys come from https://github.com/nodejs/node/blob/master/README.md#release-keys
#These are keys used to sign older releases
EvanLucas=B9AE9905FFD7803F25714661B63B535A4C206CA9
GibsonFahnestock=77984A986EBC2AA786BC0F66B01FBB92821C587A
JeremiahSenkpiel=FD3A5288F042B6850C66B31F09FE44734EB7990E
ChrisDickinson=9554F04D7259F04124DE6B476D5A82AC7E37093B
IsaacZSchlueter=93C7E9E91B49E432C2F75674B0A78B0A6C481CF6
ItaloACasas=56730D5401028683275BD23C23EFEFE93C4CFFFE
JulienGilli=114F43EE0176B71C7BC219DD50A3051F888C628D
TimothyJFontaine=7937DFD2AB06298B2293C3187D33FF9D0246406D
DanielleAdamsOld=1C050899334244A8AF75E53792EF661D867B9DFA

#Latest releases are signed with these keys

BethGriggs=4ED778F539E3634C779C87C6D7062848A1AB005C
ColinIhrig=94AE36675C464D64BAFA68DD7434390BDBE9B9C5
DanielleAdams=74F12602B6F1C4E913FAA37AD3A89613643B6201
JamesMSnell=71DCFD284A79C3B38668286BC97EC7A07EDE3FC1
MichaelZasso=8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600
MylesBorins=C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8
RichardLau=C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C
RodVagg=DD8F2338BAE7501E3DD5AC78C273792F7D83545D
RubenBridgewater=A48C2BEE680E841632CD4E44F07496B3EB3C1762
RuyAdorno=108F52B48DB57BB0CC439B2997B01419BD92F80A
ShelleyVohr=B9E2F5981AA6E0CD28160D9FF13993A75599653C

keylist="${EvanLucas} ${GibsonFahnestock} ${JeremiahSenkpiel} ${ChrisDickinson} ${IsaacZSchlueter} ${ItaloACasas} ${JulienGilli} ${TimothyJFontaine} ${DanielleAdamsOld} ${BethGriggs} ${ColinIhrig} ${DanielleAdams} ${JamesMSnell} ${MichaelZasso} ${MylesBorins} ${RichardLau} ${RodVagg} ${RubenBridgewater} ${RuyAdorno} ${ShelleyVohr}"

for key in ${keylist} ; do
  gpg2 --keyserver hkp://pgp.mit.edu:11371 --recv-keys ${key}
done

gpg2 --armor --output=contents/KEYS --export ${keylist}
