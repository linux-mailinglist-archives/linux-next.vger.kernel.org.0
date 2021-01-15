Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C82D2F723B
	for <lists+linux-next@lfdr.de>; Fri, 15 Jan 2021 06:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731818AbhAOFfw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jan 2021 00:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731816AbhAOFfw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Jan 2021 00:35:52 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F735C061575;
        Thu, 14 Jan 2021 21:35:11 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DH8yh12K5z9sVw;
        Fri, 15 Jan 2021 16:35:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610688908;
        bh=emPXlB/8XFwtYHEnzgQ3UY9TP5R8bJvzm3zmq4Ffy3I=;
        h=Date:From:To:Cc:Subject:From;
        b=sM3n04L2wT+fjXCmz7ZB4qnGvtfW6zWjzrR186OUjATl8zYxWuNTyd8yaVbFCQMQg
         xaSZDr3ig44aihz9IZMifO+shqpGCs6iPtBSEhJjPP5WWGwNQLyTrs5McBia0CxUTJ
         X0PRCdv8mAXjQYETrPtSSecesTaGOWTzAamnIrKbJZgk/OJoRdoUg8LNlAcKwMLfAl
         9XHlXEPwattzfhy+uQ1uxIJPvWivbDUCN1OcIZv1IgFPEAT394zKDgY4AbAlweKR08
         TYCcTgz279s3O4Jvdd6czAfzkAXQ/fHJUjvKN6I4LMos1Wb2IlvYcwtyMDKbx0CvQ8
         YhPBh57wGof7g==
Date:   Fri, 15 Jan 2021 16:35:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Huang Rui <ray.huang@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210115163505.4132a5b3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H2fiLh1ghCTXHVqBaUO8Y2g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H2fiLh1ghCTXHVqBaUO8Y2g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'va=
ngogh_get_smu_metrics_data':
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:300:10: error: '=
boot_cpu_data' undeclared (first use in this function); did you mean 'boot_=
cpuid'?
  300 |          boot_cpu_data.x86_max_cores * sizeof(uint16_t));
      |          ^~~~~~~~~~~~~
      |          boot_cpuid
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'va=
ngogh_read_sensor':
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1320:11: error: =
'boot_cpu_data' undeclared (first use in this function); did you mean 'boot=
_cpuid'?
 1320 |   *size =3D boot_cpu_data.x86_max_cores * sizeof(uint16_t);
      |           ^~~~~~~~~~~~~
      |           boot_cpuid
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'va=
ngogh_od_edit_dpm_table':
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1460:19: error: =
'boot_cpu_data' undeclared (first use in this function); did you mean 'boot=
_cpuid'?
 1460 |   if (input[0] >=3D boot_cpu_data.x86_max_cores) {
      |                   ^~~~~~~~~~~~~
      |                   boot_cpuid

Caused by commits

  517cb957c43b ("drm/amd/pm: implement the processor clocks which read by m=
etric")
  0d90d0ddd10e ("drm/amd/pm: implement processor fine grain feature for van=
gogh (v3)")

The only thing I could do easily is to disable CONFIG_DRM_AMDGPU for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/H2fiLh1ghCTXHVqBaUO8Y2g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmABKYkACgkQAVBC80lX
0Gzcvwf9FMxLyUAQnhew3amfypq9a3ESOn7cq8a2BdIgt7wJjJ3OlXp4/0QkBnql
2Ee5mGx4EkNHeFUl9AmrfCnlkWNmEoqU2WSKMCS7J2PwvRimzMo2O6h2FAd2xjea
N2+cpkMvh6ChQxwoMRLn7lsjk7mJSc4SExc9T0qEQRTKozujv4rTiPPwP4ejbKBS
bK/4XaJK9UJP0QsWwboXmd39NNIvHIL+etT3ilDnyzSyC78M7rwGfmcaGTKdeSAj
PFyu3NU+Cbse9K2Vm0qqVIifxqyg43gZqw3wbxWQJ1nY+amjQrTzUgRQ+eWv5gnZ
o5p9InibKdzZrhQoFUiSB0DcI5u7OA==
=2hcq
-----END PGP SIGNATURE-----

--Sig_/H2fiLh1ghCTXHVqBaUO8Y2g--
