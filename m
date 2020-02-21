Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E95F167933
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2020 10:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgBUJTu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Feb 2020 04:19:50 -0500
Received: from sonic306-20.consmr.mail.ne1.yahoo.com ([66.163.189.82]:39813
        "EHLO sonic306-20.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726984AbgBUJTu (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Feb 2020 04:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1582276789; bh=5gcjSyntdQ2SQ2GwLs8w0yMxWPFH8Sibsmrdid2aSoQ=; h=Date:From:Reply-To:Subject:References:From:Subject; b=SBcLFosmhYCMk+KrbvFxKB4psZmxX9Z2ZnqSPn2bXSR/WVel7VkRA4aU3kzTUA0Jey2C4PH6eUvMmU75tGKnpF6cedM/cSl16uzqaVTtmpvObA5bZ3gRE6noDmroHHnLkw3pvwkr18D/eHwXisuyojqX0VCIbNQnWNokGQJO+9ue7V01RBH3mzXlACnhoYu/B34BG+uqLRdcOLp0wHIaEv4No2kwruws9LFDNfFr7atfO6x26IHlccGKXXvSpS9kj+7I2DiMM/ikxzqgLCN/BLC3H/oYkFgaxxpDpgmU3sH6VzqjOIebnme/oY46mo9TJ58mx/rFG9QmyPbiLokBpg==
X-YMail-OSG: 5774msUVM1nIQe.lvPlz41T4KyVoj2PME7x8ChZHUBKW8X_FC0OcZTGWugxdoP3
 ytO_e93qe4vODr2dHGnIyTGw7ayhAh_cLWuz5rcezAMRF9TLnjcoTZIRc6Uciwqzje4oWNVi2oze
 AA_Xq8EGY6ReznCAn_jhG.wpWGLUhI._i12gM1grjxJDJwXMuuBmnMxMQbNtZ6IV0MHRYxddkMWS
 akFvwZmiLAXffFbTiXx9EiqRUG1XThzkOHSXFc_4nByi7SmcC3O8d16HqA5SXlv4fKhNrrzqJwPl
 GIK_Rh8lQODkDsSP.hlhzLmeYoE0km3v4Mdjv7rfoinGXPwAzEIgnWN0NeYpnikvD4jUXC8vfcB1
 DXC4.VbgPh6KWCE78cpKKMOch49mXicwwTCrpLe2.0Ey4QaZzTQICMN3KhfwWH30s0p.3viKB_Uy
 Q1ZAwjk1D5XpUng.04LrhykvdQsrEcPODKvOx6XSdfaAkapP_La7ZpismnMbM7FxBG1yDOwPU9N5
 nJGL7STQzhDpjXljxthGuQLrfXBcPSRKn7JgjA59XZ2biN5E7g_iB8TqRzCYhWcYreSYDFoLoLiE
 NkZ3L23hwChUga5kBqU1xLuOwV8fumhUMQ7uNGrm8VNLwNp84Y9N1eGnncyQHBKCp1gyuKfN485.
 oqkJd.dKPk4UqGtuCuP4pVGAKadoKdaX9xdRPtyKD6ehdRLZaXqeK0jkCrUjbiCNZRlKs7jcHC3.
 HVACV0DqvxeaG1DmRx4df.eERXydnkpq37qtulWxeBDLVLmT1QFSgGxo2agMcS0JeDEDzzYPz3AF
 pBKynn2ehd73kCCEAjrjZu.A0QMNqJBYj2RiM4aFb2qBtNJCbdfvzzLZo8mMwxaVjVdrJjZfEZmy
 zWyIUvZlPj5M8L.L9WRLyHtT2.3m7Q9s0EKvHQK1c0srQpS.Io2G4p4KyyVpnxlGUMxJnQtTEotX
 zcLF8d8hOtlrbURWjJVNFiiqKVbJBvEupbJvLfgGFV1xx1FAEwx_vqc_rIOzrbhHK0w8EVv.E6I5
 O6rmzLCxMU2IVbmUFuLFGb2hEngvJcuhr8cguQHEo92SFUyhOkw0CcuRUTUNjyXGeCZ6.hnfrtYg
 Bixc4uhksaQFN.OdRj_xa3BOyQxQo674HSwjA0Esq718VDzIalp8mkI41kX7MBc9nhVKc2mEnlnR
 lFiAtXSo.Oj6kzVJcaPBCPzLp1tq4unFRkSm8H5wB_yuENlTnX9fktWVpiEEJsAo_MJo17.5O35m
 .FAOauxHTtZeey4TOIkrXN9SiIQe2WV8qr0mS9_vs2tr2CZMmpruK_q4jIIVPO4dCttdnCMk-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Fri, 21 Feb 2020 09:19:49 +0000
Date:   Fri, 21 Feb 2020 09:19:46 +0000 (UTC)
From:   Ayesha Coulibaly <missayeshawarlord@aol.com>
Reply-To: aycl111@aol.com
Message-ID: <142114973.6098855.1582276786850@mail.yahoo.com>
Subject: =?UTF-8?Q?Hi=C2=A0dear=C2=A0,?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <142114973.6098855.1582276786850.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15199 YMailNodin Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org




Hi=C2=A0dear=C2=A0,

With=C2=A0warm=C2=A0heart,=C2=A0I=C2=A0offer=C2=A0my=C2=A0friendship=C2=A0a=
nd=C2=A0greetings,=C2=A0I=C2=A0hope=C2=A0this=C2=A0message=C2=A0meet=C2=A0y=
ou=C2=A0in=C2=A0good=C2=A0time.=C2=A0However,=C2=A0Mine=C2=A0names=C2=A0are=
=C2=A0Ms.=C2=A0Ayesha=C2=A0Coulibaly.=C2=A0I=C2=A0am=C2=A024=C2=A0years=C2=
=A0old=C2=A0female.=C2=A0I=C2=A0have=C2=A0sent=C2=A0you=C2=A0mail=C2=A0twic=
e=C2=A0but=C2=A0you=C2=A0never=C2=A0replied=C2=A0any=C2=A0of=C2=A0them.=C2=
=A0I=C2=A0humbly=C2=A0ask=C2=A0that=C2=A0you=C2=A0reply=C2=A0this=C2=A0mess=
age,=C2=A0to=C2=A0enable=C2=A0me=C2=A0disclose=C2=A0the=C2=A0reason=C2=A0wh=
ile=C2=A0I=C2=A0have=C2=A0been=C2=A0trying=C2=A0to=C2=A0reach=C2=A0out=C2=
=A0to=C2=A0you.=C2=A0I=C2=A0do=C2=A0apologize=C2=A0for=C2=A0infringing=C2=
=A0on=C2=A0your=C2=A0privacy.

greetings=C2=A0Ayesha=C2=A0Coulibaly.
