Return-Path: <linux-next+bounces-9620-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC2DD16A3E
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 05:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C9C83014BF7
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 04:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FCC34FF46;
	Tue, 13 Jan 2026 04:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nADxuZUL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073AB270EC1;
	Tue, 13 Jan 2026 04:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768280091; cv=none; b=MmV5uzf0jKVsKUvRlPoXno143xPMBKAJDfrhD3gMhwl+BawL8fg2mo3NitRmsnRnPll8eUTBqlFCFH+pwXfgZym8DZcx0vV3i4sXAM2REB0XiRASteBhWw+9rmK0YE9jcHi8y1VuWrI3/rzaH/XiHIMqY63uUAwlk5v+OmwTYDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768280091; c=relaxed/simple;
	bh=qK/7yDdWMocWCq+dr1UEjeV0ckGt1qmuShjEeEuM4MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YP2jNjoKKrAH4+5HF6q0ilWUeKSlzb1Yl4gaxHXJUAFz2N9A8pqGkURClBfpWaf0XNt1W1lZs7cnIBL6RGZFb9tzlXNniVyI/dRAN4H6hH9ZiKGQ/fyx8mSK/dEZQFHOgHrPaHJwPVUEvkWjTduKODn+Vu86fiJJbifLfA1A4yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nADxuZUL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768280086;
	bh=4KueHcUUGvCrTKzRHxfJqoeI9Cfsf5E2aytlQ+GRH9M=;
	h=Date:From:To:Cc:Subject:From;
	b=nADxuZULN9VVEaV3zuahN/Hq5AlYob7vOH4Cn3wW2dj+E3f56lYTLRcsNQSHjwJXb
	 XVuMJG25vJHL3Dxa8ICe3U1ji04rln5aKXlI4dOwe/UXHhsu4+BkowySBdHHBf0fSS
	 1cjf8v3QCTkSU5vDZldS6A/+GzPD+kh49c/R6ycGwdCceJMxiWQKC2sBeX2kAytLU5
	 yl/MJzjYhEFhUjU8QS4r9FYT8gLANGqQ7dmHqOcDuCyZGbROh415dr1R5RlDjUiskn
	 ZONNq/Er7C0fp5evfjNOXiHzemZnzIf/BiYYUryCOGcdxsqhZs7qkVZmF5ST3qzzwN
	 KVOKu7IdUy5SA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqxkF4Qr1z4wDk;
	Tue, 13 Jan 2026 15:54:45 +1100 (AEDT)
Date: Tue, 13 Jan 2026 15:54:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Laveesh Bansal <laveeshb@laveeshbansal.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20260113155444.57c7775b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2+eiYMNxkl+8i3NxfwONVF.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2+eiYMNxkl+8i3NxfwONVF.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/coretemp.rst:123: ERROR: Malformed table.
Text in column margin in table line 52.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Process         Processor                                       TjMax(C)

22nm            Core i5/i7 Processors
                i7 3920XM, 3820QM, 3720QM, 3667U, 3520M         105
                i5 3427U, 3360M/3320M                           105
                i7 3770/3770K                                   105
                i5 3570/3570K, 3550, 3470/3450                  105
                i7 3770S                                        103
                i5 3570S/3550S, 3475S/3470S/3450S               103
                i7 3770T                                        94
                i5 3570T                                        94
                i5 3470T                                        91

32nm            Core i3/i5/i7 Processors
                i7 2600                                         98
                i7 660UM/640/620, 640LM/620, 620M, 610E         105
                i5 540UM/520/430, 540M/520/450/430              105
                i3 330E, 370M/350/330                           90 rPGA, 10=
5 BGA
                i3 330UM                                        105

32nm            Core i7 Extreme Processors
                980X                                            100

32nm            Celeron Processors
                U3400                                           105
                P4505/P4500                                     90

32nm            Atom Processors
                S1260/1220                                      95
                S1240                                           102
                Z2460                                           90
                Z2760                                           90
                D2700/2550/2500                                 100
                N2850/2800/2650/2600                            100

22nm            Atom Processors (Silvermont/Bay Trail)
                E3845/3827/3826/3825/3815/3805                  110
                Z3795/3775/3770/3740/3736/3735/3680             90

22nm            Atom Processors (Silvermont/Moorefield)
                Z3580/3570/3560/3530                            90

14nm            Atom Processors (Airmont/Cherry Trail)
                x5-Z8550/Z8500/Z8350/Z8330/Z8300                90
                x7-Z8750/Z8700                                  90

14nm            Atom Processors (Goldmont/Apollo Lake)
                x5-E3940/E3930                                  105
                x7-E3950                                        105

14nm            Celeron/Pentium Processors (Goldmont/Apollo Lake)
                J3455/J3355                                     105
                N3450/N3350                                     105
                N4200                                           105

14nm            Celeron/Pentium Processors (Goldmont Plus/Gemini Lake)
                J4105/J4005                                     105
                N4100/N4000                                     105
                N5000                                           105

10nm            Atom Processors (Tremont/Elkhart Lake)
                x6000E                                          105

10nm            Celeron/Pentium Processors (Tremont/Jasper Lake)
                N4500/N5100/N6000 series                        105

45nm            Xeon Processors 5400 Quad-Core
                X5492, X5482, X5472, X5470, X5460, X5450        85
                E5472, E5462, E5450/40/30/20/10/05              85
                L5408                                           95
                L5430, L5420, L5410                             70

45nm            Xeon Processors 5200 Dual-Core
                X5282, X5272, X5270, X5260                      90
                E5240                                           90
                E5205, E5220                                    70, 90
                L5240                                           70
                L5238, L5215                                    95

45nm            Atom Processors
                D525/510/425/410                                100
                K525/510/425/410                                100
                Z670/650                                        90
                Z560/550/540/530P/530/520PT/520/515/510PT/510P  90
                Z510/500                                        90
                N570/550                                        100
                N475/470/455/450                                100
                N280/270                                        90
                330/230                                         125
                E680/660/640/620                                90
                E680T/660T/640T/620T                            110
                E665C/645C                                      90
                E665CT/645CT                                    110
                CE4170/4150/4110                                110
                CE4200 series                                   unknown
                CE5300 series                                   unknown

45nm            Core2 Processors
                Solo ULV SU3500/3300                            100
                T9900/9800/9600/9550/9500/9400/9300/8300/8100   105
                T6670/6500/6400                                 105
                T6600                                           90
                SU9600/9400/9300                                105
                SP9600/9400                                     105
                SL9600/9400/9380/9300                           105
                P9700/9600/9500/8800/8700/8600/8400/7570        105
                P7550/7450                                      90

45nm            Core2 Quad Processors
                Q9100/9000                                      100

45nm            Core2 Extreme Processors
                X9100/9000                                      105
                QX9300                                          100

45nm            Core i3/i5/i7 Processors
                i7 940XM/920                                    100
                i7 840QM/820/740/720                            100

45nm            Celeron Processors
                SU2300                                          100
                900                                             105

65nm            Core2 Duo Processors
                Solo U2200, U2100                               100
                U7700/7600/7500                                 100
                T7800/7700/7600/7500/7400/7300/7250/7200/7100   100
                T5870/5670/5600/5550/5500/5470/5450/5300/5270   100
                T5250                                           100
                T5800/5750/5200                                 85
                L7700/7500/7400/7300/7200                       100

65nm            Core2 Extreme Processors
                X7900/7800                                      100

65nm            Core Duo Processors
                U2500/2400                                      100
                T2700/2600/2450/2400/2350/2300E/2300/2250/2050  100
                L2500/2400/2300                                 100

65nm            Core Solo Processors
                U1500/1400/1300                                 100
                T1400/1350/1300/1250                            100

65nm            Xeon Processors 5000 Quad-Core
                X5000                                           90-95
                E5000                                           80
                L5000                                           70
                L5318                                           95

65nm            Xeon Processors 5000 Dual-Core
                5080, 5063, 5060, 5050, 5030                    80-90
                5160, 5150, 5148, 5140, 5130, 5120, 5110        80
                L5138                                           100

65nm            Celeron Processors
                T1700/1600                                      100
                560/550/540/530                                 100
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D [docutils]

Introduced by commit

  099cc1051df7 ("Documentation: hwmon: coretemp: Update supported CPUs and =
TjMax values")

--=20
Cheers,
Stephen Rothwell

--Sig_/2+eiYMNxkl+8i3NxfwONVF.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmll0BQACgkQAVBC80lX
0GxlgQf8DiO6iP/awSsJmm5kqfnUPw3n5FbJpwj5pwXGUoPJTfmiEc2grgkyicbN
6O23ik9sNLIzwg5S5f3r2r03/IzzKb+72uEAjgLpwCKHOWNW33kbPS3OVMrqQjzJ
m19gQe46e8TCQhNuBdo9veBZfbIFp34+3n9GkZV0yVVMXqGquaQCtTVD5HMj2YK/
2U237KWtgWDODkB8sb5RQC8HxCHmHvT961U9A8yOu4ct39r1iwe+bX8MLsCuFRuD
k3MddUxVBhfvDaJoGvfuZztA4tV4fW5C01N0ERC+RHk20ZILybJW42YroKxKnTdm
Lkt3hTgJEqDvk/XUfMCBZk0Wxjz09w==
=YuvX
-----END PGP SIGNATURE-----

--Sig_/2+eiYMNxkl+8i3NxfwONVF.--

