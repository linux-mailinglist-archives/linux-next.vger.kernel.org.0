Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40571BB8FC
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 10:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgD1IlK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 04:41:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40403 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726641AbgD1IlK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 04:41:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BFVB5s9Dz9sPF;
        Tue, 28 Apr 2020 18:41:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588063267;
        bh=ptpEa1Aspg9B4NGd9oCsQ3KP+InmwZ4efCSb6j8tvzE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=D45JOomA8t5PHGgU/XI8Dj4gnjE2JS/hl7fU1PSiqi6DqGm3WnIMDH6kwB4m3NeZP
         Cm20hcJoDQZa3Xda0FLx+KC0nH71iBAiaeRy4iMddiYXm5DjE9SfIdyGtAG5vnXrgR
         zhz5o8v2sWsEpSQJKoXQsU04i2Qx0lvXqmsrD0JKpXlOvZP6YS1MgUZ/uwyue7tj/9
         IZk/SaGfPOsxSR1UgbRNrhWzs0W+BJ8/OmIPe+dHNtZAFKWSUAUpiz+cnrOMpZK94j
         ETavUaws6bCacsGJ8oFRHU8YcEme1ZHp2jz0+kWTMkNNowdgrCCALEQYLPU1Vxo661
         t0zgh/15TNSOQ==
Date:   Tue, 28 Apr 2020 18:41:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: Re: linux-next: Fixes tag needs some work in the i2c tree
Message-ID: <20200428184104.27753d10@canb.auug.org.au>
In-Reply-To: <20200428070130.GA2522@kunai>
References: <20200428082848.19d38b67@canb.auug.org.au>
        <20200428070130.GA2522@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/egCjSklHzszSZ.e1jLE4kIz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/egCjSklHzszSZ.e1jLE4kIz
Content-Type: multipart/mixed; boundary="MP_/LM24KB13HLl5YJlcW31=J/X"

--MP_/LM24KB13HLl5YJlcW31=J/X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Wolfram,

On Tue, 28 Apr 2020 09:01:30 +0200 Wolfram Sang <wsa@the-dreams.de> wrote:
>
> > This triggered because the "space" after the ":" is a Unicode non-break=
ing
> > space (U+0x00a0, UTF8 0xc2 0xa0).  I am not sure if this is a problem
> > or not.  This is the forst time I have seen this. =20
>=20
> Thanks for reporting, I obviously didn't notice. Well, technically,
> commit messages can be UTF8, so not really an error. However, it will
> probably break lots of homebrew scripts, so a checkpatch warning it is,
> then?

Not checkpatch, but my own script that checks some things about Fixes
tags (attached).  Interestingly, my script does allow some other Unicode
things (like matching quotes) ...

> I'll fix it nonetheless.

Thanks.

--=20
Cheers,
Stephen Rothwell

--MP_/LM24KB13HLl5YJlcW31=J/X
Content-Type: application/x-shellscript
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=check_fixes

IyEvYmluL2Jhc2gKCmlmIFsgIiQjIiAtbHQgMSBdOyB0aGVuCiAgICAgICAgcHJpbnRmICdVc2Fn
ZTogJXMgPGNvbW1pdCByYW5nZT5cbicsICIkMCIgMT4mMgogICAgICAgIGV4aXQgMQpmaQoKY29t
bWl0cz0kKGdpdCByZXYtbGlzdCAtLW5vLW1lcmdlcyAtaSAtLWdyZXA9J15bWzpzcGFjZTpdXSpG
aXhlczonICIkQCIpCmlmIFsgLXogIiRjb21taXRzIiBdOyB0aGVuCiAgICAgICAgZXhpdCAwCmZp
CgojIFRoaXMgc2hvdWxkIGJlIGEgZ2l0IHRyZWUgdGhhdCBjb250YWlucyAqb25seSogTGludXMn
IHRyZWUKTGludXNfdHJlZT0iJHtIT01FfS9rZXJuZWxzL2xpbnVzLmdpdCIKCnNwbGl0X3JlPSde
KFtDY11bT29dW01tXVtNbV1bSWldW1R0XSk/W1s6c3BhY2U6XV0qKFtbOnhkaWdpdDpdXXs1LH0p
KFtbOnNwYWNlOl1dKikoLiopJCcKbmw9JCdcbicKdGFiPSQnXHQnCgojIFN0cmlwIHRoZSBsZWFk
aW5nIGFuZCB0cmFpbmluZyBzcGFjZXMgZnJvbSBhIHN0cmluZwpzdHJpcF9zcGFjZXMoKQp7Cglb
WyAiJDEiID1+IF5bWzpzcGFjZTpdXSooLipbXls6c3BhY2U6XV0pW1s6c3BhY2U6XV0qJCBdXQoJ
ZWNobyAiJHtCQVNIX1JFTUFUQ0hbMV19Igp9Cgpmb3IgYyBpbiAkY29tbWl0czsgZG8KCgljb21t
aXRfbG9nPSQoZ2l0IGxvZyAtMSAtLWZvcm1hdD0nJWggKCIlcyIpJyAiJGMiKQoJY29tbWl0X21z
Zz0iSW4gY29tbWl0CgogICRjb21taXRfbG9nCgoiCgoJZml4ZXNfbGluZXM9JChnaXQgbG9nIC0x
IC0tZm9ybWF0PSclQicgIiRjIiB8CgkJCWdyZXAgLWkgJ15bWzpzcGFjZTpdXSpGaXhlczonKQoK
CXdoaWxlIHJlYWQgLXIgZmxpbmU7IGRvCgkJW1sgIiRmbGluZSIgPX4gXltbOnNwYWNlOl1dKltG
Zl1bSWldW1h4XVtFZV1bU3NdOltbOnNwYWNlOl1dKiguKikkIF1dCgkJZj0iJHtCQVNIX1JFTUFU
Q0hbMV19IgoJCWZpeGVzX21zZz0iRml4ZXMgdGFnCgogICRmbGluZQoKaGFzIHRoZXNlIHByb2Js
ZW0ocyk6CgoiCgkJc2hhPQoJCXN1YmplY3Q9CgkJbXNnPQoJCWlmIFtbICIkZiIgPX4gJHNwbGl0
X3JlIF1dOyB0aGVuCgkJCWZpcnN0PSIke0JBU0hfUkVNQVRDSFsxXX0iCgkJCXNoYT0iJHtCQVNI
X1JFTUFUQ0hbMl19IgoJCQlzcGFjZXM9IiR7QkFTSF9SRU1BVENIWzNdfSIKCQkJc3ViamVjdD0i
JHtCQVNIX1JFTUFUQ0hbNF19IgoJCQlpZiBbICIkZmlyc3QiIF07IHRoZW4KCQkJCW1zZz0iJHtt
c2c6KyR7bXNnfSR7bmx9fSAgLSBsZWFkaW5nIHdvcmQgJyRmaXJzdCcgdW5leHBlY3RlZCIKCQkJ
ZmkKCQkJaWYgWyAteiAiJHN1YmplY3QiIF07IHRoZW4KCQkJCW1zZz0iJHttc2c6KyR7bXNnfSR7
bmx9fSAgLSBtaXNzaW5nIHN1YmplY3QiCgkJCWVsaWYgWyAteiAiJHNwYWNlcyIgXTsgdGhlbgoJ
CQkJbXNnPSIke21zZzorJHttc2d9JHtubH19ICAtIG1pc3Npbmcgc3BhY2UgYmV0d2VlbiB0aGUg
U0hBMSBhbmQgdGhlIHN1YmplY3QiCgkJCWZpCgkJZWxzZQoJCQlwcmludGYgJyVzJXMgIC0gJXNc
bicgIiRjb21taXRfbXNnIiAiJGZpeGVzX21zZyIgJ05vIFNIQTEgcmVjb2duaXNlZCcKCQkJY29t
bWl0X21zZz0nJwoJCQljb250aW51ZQoJCWZpCgkJaWYgISBnaXQgcmV2LXBhcnNlIC1xIC0tdmVy
aWZ5ICIkc2hhIiA+L2Rldi9udWxsOyB0aGVuCgkJCXByaW50ZiAnJXMlcyAgLSAlc1xuJyAiJGNv
bW1pdF9tc2ciICIkZml4ZXNfbXNnIiAnVGFyZ2V0IFNIQTEgZG9lcyBub3QgZXhpc3QnCgkJCWNv
bW1pdF9tc2c9JycKCQkJY29udGludWUKCQlmaQoKCQlpZiBbICIkeyNzaGF9IiAtbHQgMTIgXTsg
dGhlbgoJCQltc2c9IiR7bXNnOiske21zZ30ke25sfX0gIC0gU0hBMSBzaG91bGQgYmUgYXQgbGVh
c3QgMTIgZGlnaXRzIGxvbmcke25sfSAgICBDYW4gYmUgZml4ZWQgYnkgc2V0dGluZyBjb3JlLmFi
YnJldiB0byAxMiAob3IgbW9yZSkgb3IgKGZvciBnaXQgdjIuMTEke25sfSAgICBvciBsYXRlcikg
anVzdCBtYWtpbmcgc3VyZSBpdCBpcyBub3Qgc2V0IChvciBzZXQgdG8gXCJhdXRvXCIpLiIKCQlm
aQoJCSMgcmVkdWNlIHRoZSBzdWJqZWN0IHRvIHRoZSBwYXJ0IGJldHdlZW4gKCkgaWYgdGhlcmUK
CQlpZiBbWyAiJHN1YmplY3QiID1+IF5cKCguKilcKSBdXTsgdGhlbgoJCQlzdWJqZWN0PSIke0JB
U0hfUkVNQVRDSFsxXX0iCgkJZWxpZiBbWyAiJHN1YmplY3QiID1+IF5cKCguKikgXV07IHRoZW4K
CQkJc3ViamVjdD0iJHtCQVNIX1JFTUFUQ0hbMV19IgoJCQltc2c9IiR7bXNnOiske21zZ30ke25s
fX0gIC0gU3ViamVjdCBoYXMgbGVhZGluZyBidXQgbm8gdHJhaWxpbmcgcGFyZW50aGVzZXMiCgkJ
ZmkKCgkJIyBzdHJpcCBtYXRjaGluZyBxdW90ZXMgYXQgdGhlIHN0YXJ0IGFuZCBlbmQgb2YgdGhl
IHN1YmplY3QKCQkjIHRoZSB1bmljb2RlIGNoYXJhY3RlcnMgaW4gdGhlIGNsYXNzZXMgYXJlCgkJ
IyBVKzIwMUMgTEVGVCBET1VCTEUgUVVPVEFUSU9OIE1BUksKCQkjIFUrMjAxRCBSSUdIVCBET1VC
TEUgUVVPVEFUSU9OIE1BUksKCQkjIFUrMjAxOCBMRUZUIFNJTkdMRSBRVU9UQVRJT04gTUFSSwoJ
CSMgVSsyMDE5IFJJR0hUIFNJTkdMRSBRVU9UQVRJT04gTUFSSwoJCXJlMT0kJ15bXCJcdTIwMUNd
KC4qKVtcIlx1MjAxRF0kJwoJCXJlMj0kJ15bXCdcdTIwMThdKC4qKVtcJ1x1MjAxOV0kJwoJCXJl
Mz0kJ15bXCJcJ1x1MjAxQ1x1MjAxOF0oLiopJCcKCQlpZiBbWyAiJHN1YmplY3QiID1+ICRyZTEg
XV07IHRoZW4KCQkJc3ViamVjdD0iJHtCQVNIX1JFTUFUQ0hbMV19IgoJCWVsaWYgW1sgIiRzdWJq
ZWN0IiA9fiAkcmUyIF1dOyB0aGVuCgkJCXN1YmplY3Q9IiR7QkFTSF9SRU1BVENIWzFdfSIKCQll
bGlmIFtbICIkc3ViamVjdCIgPX4gJHJlMyBdXTsgdGhlbgoJCQlzdWJqZWN0PSIke0JBU0hfUkVN
QVRDSFsxXX0iCgkJCW1zZz0iJHttc2c6KyR7bXNnfSR7bmx9fSAgLSBTdWJqZWN0IGhhcyBsZWFk
aW5nIGJ1dCBubyB0cmFpbGluZyBxdW90ZXMiCgkJZmkKCgkJc3ViamVjdD0kKHN0cmlwX3NwYWNl
cyAiJHN1YmplY3QiKQoKCQl0YXJnZXRfc3ViamVjdD0kKGdpdCBsb2cgLTEgLS1mb3JtYXQ9JyVz
JyAiJHNoYSIpCgkJdGFyZ2V0X3N1YmplY3Q9JChzdHJpcF9zcGFjZXMgIiR0YXJnZXRfc3ViamVj
dCIpCgoJCSMgbWF0Y2ggd2l0aCBlbGxpcHNlcwoJCWNhc2UgIiRzdWJqZWN0IiBpbgoJCSouLi4p
CXN1YmplY3Q9IiR7c3ViamVjdCUuLi59IgoJCQl0YXJnZXRfc3ViamVjdD0iJHt0YXJnZXRfc3Vi
amVjdDowOiR7I3N1YmplY3R9fSIKCQkJOzsKCQkuLi4qKQlzdWJqZWN0PSIke3N1YmplY3QjLi4u
fSIKCQkJdGFyZ2V0X3N1YmplY3Q9IiR7dGFyZ2V0X3N1YmplY3Q6IC0keyNzdWJqZWN0fX0iCgkJ
CTs7CgkJKlwgLi4uXCAqKQoJCQlzMT0iJHtzdWJqZWN0JSAuLi4gKn0iCgkJCXMyPSIke3N1Ympl
Y3QjKiAuLi4gfSIKCQkJc3ViamVjdD0iJHMxICRzMiIKCQkJdDE9IiR7dGFyZ2V0X3N1YmplY3Q6
MDokeyNzMX19IgoJCQl0Mj0iJHt0YXJnZXRfc3ViamVjdDogLSR7I3MyfX0iCgkJCXRhcmdldF9z
dWJqZWN0PSIkdDEgJHQyIgoJCQk7OwoJCWVzYWMKCQlzdWJqZWN0PSQoc3RyaXBfc3BhY2VzICIk
c3ViamVjdCIpCgkJdGFyZ2V0X3N1YmplY3Q9JChzdHJpcF9zcGFjZXMgIiR0YXJnZXRfc3ViamVj
dCIpCgoJCWlmIFsgIiRzdWJqZWN0IiAhPSAiJHt0YXJnZXRfc3ViamVjdDowOiR7I3N1YmplY3R9
fSIgXTsgdGhlbgoJCQltc2c9IiR7bXNnOiske21zZ30ke25sfX0gIC0gU3ViamVjdCBkb2VzIG5v
dCBtYXRjaCB0YXJnZXQgY29tbWl0IHN1YmplY3Qke25sfSAgICBKdXN0IHVzZSR7bmx9JHt0YWJ9
Z2l0IGxvZyAtMSAtLWZvcm1hdD0nRml4ZXM6ICVoIChcIiVzXCIpJyIKCQlmaQoJCWxzaGE9JChj
ZCAiJExpbnVzX3RyZWUiICYmIGdpdCByZXYtcGFyc2UgLXEgLS12ZXJpZnkgIiRzaGEiKQoJCWlm
IFsgLXogIiRsc2hhIiBdOyB0aGVuCgkJCWNvdW50PSQoZ2l0IHJldi1saXN0IC0tY291bnQgIiRz
aGEiLi4iJGMiKQoJCQlpZiBbICIkY291bnQiIC1lcSAwIF07IHRoZW4KCQkJCW1zZz0iJHttc2c6
KyR7bXNnfSR7bmx9fSAgLSBUYXJnZXQgaXMgbm90IGFuIGFuY2VzdG9yIG9mIHRoaXMgY29tbWl0
IgoJCQlmaQoJCWZpCgkJaWYgWyAiJG1zZyIgXTsgdGhlbgoJCQlwcmludGYgJyVzJXMlc1xuJyAi
JGNvbW1pdF9tc2ciICIkZml4ZXNfbXNnIiAiJG1zZyIKCQkJY29tbWl0X21zZz0nJwoJCWZpCglk
b25lIDw8PCAiJGZpeGVzX2xpbmVzIgpkb25lCgpleGl0IDAK

--MP_/LM24KB13HLl5YJlcW31=J/X--

--Sig_/egCjSklHzszSZ.e1jLE4kIz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6n7CAACgkQAVBC80lX
0GzuQAgAhJrB8TSIBFsIVtADcViSNe6/PhHKDxuV+FYkPaqJbJhZqdQED2I6N747
I5nPfht3LhaOc2X5+tffuMZO171/E9q3bm47JygEhTPfHqo//frEyjsoUvueOftk
g5SPRx0cCHTvhs5L+0Wtuh1OfTWtPsrI3qIDZpvuWz0DZhDOcMTYcxybkzTNKJAm
ypCNcHw3k/Epwp/swc9RNZi0qjIf5iSAMTBLj9/va8sSD43AxQ8h041c1gRlKfCp
HKlLbKkMS3qL1LPbzPQkT1Y5/snOsVSRRecFeIBivb//lvPIaTmPgyauRxS89a+Y
RU8fneVuuCk7yW1c0P0sX3vDp4o9MA==
=kvpB
-----END PGP SIGNATURE-----

--Sig_/egCjSklHzszSZ.e1jLE4kIz--
