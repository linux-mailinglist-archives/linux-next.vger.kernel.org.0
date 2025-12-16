Return-Path: <linux-next+bounces-9430-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 107C8CC3826
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 15:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C576C3047B59
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 14:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D5333A9D0;
	Tue, 16 Dec 2025 14:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b="TWFjRaNl"
X-Original-To: linux-next@vger.kernel.org
Received: from FR5P281CU006.outbound.protection.outlook.com (mail-germanywestcentralazon11022131.outbound.protection.outlook.com [40.107.149.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D633D4F4;
	Tue, 16 Dec 2025 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765893881; cv=fail; b=gmtFsgoT6IpcljSo75b9puWtWb/DvTYz10bPpKC1WlAyEnf79Y3hFjCN39rXUZ7dD0YN81tGXlM5/zIzjgvNCKf/b+J/C/Cgq3/C/L0IBY5MkaZz0vz5ypGeWW79h2bNEMNqRYEINWIs/0tbAxzbMNBy+GbgAenzmMTkKRV8ZNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765893881; c=relaxed/simple;
	bh=XGLcw1dA4Mtu9FeT4XNpv4Xo+QpDh87HbouLr8h6g1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lz8p5gxMsoWGjH9q1OETRgCpQJYzyEHXWJdoJJzB1J+SdVZArWbgL086fvY5WbTO1N00xPmmC5eBpNeHEIy3hUy5derC/28e9jyNIBEHbqQVv45blTZMXjO8jqcwnoMPHiN+PTR5C6jGVPHpNc1zj//de0aI+Q4BCQqWXHf5EpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de; spf=pass smtp.mailfrom=eckelmann.de; dkim=pass (1024-bit key) header.d=eckelmann.de header.i=@eckelmann.de header.b=TWFjRaNl; arc=fail smtp.client-ip=40.107.149.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eckelmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eckelmann.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f00vWNtZ4Zv4ED6cJJogINM6in0C0ojpDeqdJ13LnayuX203OQ0Kuq1EcY1O3dFL9tNbHfs6ApNe4+TWu/ZnRLO1Yujp0HKV3x9FnUgUMQVbVXk9Vm6nPLGfzqu0X3TQhWB4nNHduwxUGS7hcIG74xDyQpR9gtW32jcLBYgY+v3X8UPUU+1CgJSbGeZGGQNP41kny9KcpwgyQ4uDvSVWjPafyuNsf0tRyngjK8gj9zGV+XuNxACwWsHi9+vE1VNF+ndSe3E0twRFgMNcO3+PmBE90VJpwWcBQJqIhU8cB+u4ZaFlIlSAaqil6YUYotMFCM/jgnoc9rZymtm0virp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBUhlB2Jt9QU6R/OoNWhemSNExp2Qa4+faYe66zESOc=;
 b=CiLuZ1JxCKik4/SHoUexiNpC32UDxJwYt2GQ7aihJuQ7myQFl4JWmrpBkq0lfPe184Rl9H0UjHB8jf/APrI9+oJtkKKx5Grky4hH6jG13c3hyE0bO1VzTN9rt2jldUcEWqwxZ5ggCJeUyYOCGPFNjztzvDFwhJrWvCWLUZG829qO1h3V5878E82PTmf0MsLraH3Oq1fwGASL2snoh0JO3JSHe/ZpszQPBPlTDXdBQ/YzavJ1YobPZD1n93Pq48u15pBL8A1SAvAaWJzbg2QnpOnnpd0jjRlnstIAtFp87DUr2mRV53Xq9S7qb3Xflp1vbEpC9nhFw1sk0ZZGbSkzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eckelmann.de; dmarc=pass action=none header.from=eckelmann.de;
 dkim=pass header.d=eckelmann.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eckelmann.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBUhlB2Jt9QU6R/OoNWhemSNExp2Qa4+faYe66zESOc=;
 b=TWFjRaNlimkZqIoaUPU3gipFU+hsl0kEIrR2SEEaiiMN+Vj9oZedncRsU81umNQ0vSO/nmyRxdMWlxc0x+9EXrx/geeZfp0BfEujMH0NaHRRgoYbtCByxqSqAi1oaFUo//5+wzI0Py3frBc/w/0cX1fiyEJWNDWY5Xqo5eTLtJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eckelmann.de;
Received: from BEUP281MB3513.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:9a::8) by
 FR3P281MB1760.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:7f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Tue, 16 Dec 2025 14:04:32 +0000
Received: from BEUP281MB3513.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7ec4:ae75:3f57:1bd4]) by BEUP281MB3513.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7ec4:ae75:3f57:1bd4%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 14:04:32 +0000
Date: Tue, 16 Dec 2025 15:04:30 +0100
From: Thorsten Scherer <T.Scherer@eckelmann.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: linux-next: trees being removed
Message-ID: <2znk5jbdoy3by3jlizyb6djmhusnkpmssakb2na4kjfautkpst@th6fa5yseu3m>
References: <20251215184126.39dae2c7@canb.auug.org.au>
 <cl2urhxfwrfi4fhkntz33bpwdecjnxf3c53ngybllcqws4zydb@vrj57ee3itct>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cl2urhxfwrfi4fhkntz33bpwdecjnxf3c53ngybllcqws4zydb@vrj57ee3itct>
X-ClientProxiedBy: FR4P281CA0388.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::17) To BEUP281MB3513.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:9a::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEUP281MB3513:EE_|FR3P281MB1760:EE_
X-MS-Office365-Filtering-Correlation-Id: 2958fa80-d9bc-498f-6522-08de3cac094c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?rlwu7WcuBt5M+NUVe5HwxnuS8skVWedJJD6MkmShCQi/W8WlsVO0E2uWo3?=
 =?iso-8859-1?Q?NPp/qhW5YL8ymWtHQHJ08mJDioRjK7q7Hf+nf25kij6CIkSzBQdNys/lQK?=
 =?iso-8859-1?Q?rWxLYaUX7sCGH+xpMvaXeyvo8JYh5rFHf6yqoiqnt0GBOQCgtUvzTqVxCx?=
 =?iso-8859-1?Q?U18KVcNuhudOMrbraQjaxtnO5ocacLDj8Gkz76s5WMWLCi0SxjKVSQTsf1?=
 =?iso-8859-1?Q?eifbei/Gsequz9/PBBEC1vBJ1tCKO8QDCjabt4dJCFTZM61YCorPfi1LcF?=
 =?iso-8859-1?Q?99ZQ9RiywJ15R3qsJrfkUsb38kuw5/ZdWCIVvSkwf0ImPtf2OQ0A0finxU?=
 =?iso-8859-1?Q?bnhI5PPV6Q3y/sUBluzhAJcGyapbXf08fpCDTb2AmsbrTx2MyMbvkeFQiV?=
 =?iso-8859-1?Q?Mz4bXqKHTjXBs+706X4BZAZD1yKnEqSUdADPulfqwe3TEZh0Y4DwQkTPgA?=
 =?iso-8859-1?Q?btnlsvEsdg2NzNlp6caCn+1CVFHXgBAdeCO5hfQPoX+pzdhNtbKcvvsmz2?=
 =?iso-8859-1?Q?kWwWjYCcVnNUHxYiy1RnGZP5RStrwGomX2hfrH01+Hgn8DOifTt5BSOUue?=
 =?iso-8859-1?Q?PrDQ2a/e2X2iSCNQvUQmhZA/XH0+IvbZEtsY9Y9/H9vifRga00O2Wfar7H?=
 =?iso-8859-1?Q?4rCz5SVXRjG5zm7GDPCslxTZOgU5QjS9kTUjCV+fUAXcaGY/opXQ3HANk3?=
 =?iso-8859-1?Q?hRHfOOPnlc/3+zgeklTKjkKWeW2xedmMrI9buPfJvn0WpnV8xoDCWzOQll?=
 =?iso-8859-1?Q?KZS8VPMBwfi2sxlgtH+mJRH6PvHi3l6a1f0sIw3wBEijnUbC8ZtvKp5Y5d?=
 =?iso-8859-1?Q?etQdv3J/gtX04D2jlS+S65wUlr92u5FNdmPHT1+enCH13JEX2dHistejY3?=
 =?iso-8859-1?Q?CvoLW9j1ETb2us8Ew/u3gdPd/dqx/5b5K1iIbtCGDUTmV9jxsPKJNdGkCl?=
 =?iso-8859-1?Q?9XspJeV9YIzIaE0Th5kOn9abRmQqChfJsIG6DLnptLELz1AjtXzFVcROjL?=
 =?iso-8859-1?Q?P3pp+DgFMZijrPf5KbDeNmp3t8PStyAzecz0i7F2WxHq1zgx2QIfDlX0dx?=
 =?iso-8859-1?Q?K4QXOwhu8fEjo81mb/auJ0Dl7Gqnyctr6XYsHUMx8VGjJYHETOaOe1JSzr?=
 =?iso-8859-1?Q?44s4fdUqkCq5bAc9ZCq5Ylv2NXkAug2BQwFYnDVXnMbR8/DdsjYiToQ4F6?=
 =?iso-8859-1?Q?uXEC1FWqV8WvGjWnjmvKs+WIn9jLm2mGgkF0Q0WfgYrK0OyWzUz8XNwdON?=
 =?iso-8859-1?Q?8oCD4ExfAKnDAxnbkxcYoUORh8mscEHk1FFuAG6Hx6fPmTul25G0YsOQLj?=
 =?iso-8859-1?Q?s+F53p2hRcrwBY7uny1+cJbrHNuKzMnCqakw2OOBxcllLjREqKJaNNpKlH?=
 =?iso-8859-1?Q?H0yjQMh8MPoyGRxf3IndOzZ5GjVoqQva4VTasfn+ogGNEhB8tvSZ/c1FyO?=
 =?iso-8859-1?Q?fBhKwWG9GGUTxabCBTFdHK8HRgIrbsYeURwDoiGgoIwAaqXFbB+QobvFWI?=
 =?iso-8859-1?Q?lRDwqyoMB9wARKU15vN7LrABoeelinkY3oyKbN0GZjCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEUP281MB3513.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?sG8IFAnwW9bei9rHgekRota+uBBn4gSPRw/g4XlTsq+r1FLicNKin+yDr+?=
 =?iso-8859-1?Q?GMKDRd9rdojlsjx+aMJ3an9v6F1sujXC73Le0jgUnnLeSVnNGHgHfhoTHm?=
 =?iso-8859-1?Q?8ch+BRw+ULPHfVm36o5NClicEPBeElG4Sh32YUZaB/fD9VDhgAYA0QZ8yC?=
 =?iso-8859-1?Q?dVH5lhI1fpoiTkWvwDyk0XCp9j51u7ZLSYOJOvMnxny2Q9VTzEHd4+cYdE?=
 =?iso-8859-1?Q?VGwiLfw8FeTQs6rT0o9wUWH/7S8Wgc96dGl5X3Ss5DD5BcfbUN5lkD2AfS?=
 =?iso-8859-1?Q?vCtAZExJCdfGL1RnnKsVt/8NeGDr9PyK9q8t4teOv1qqF/RPfphZPzEohL?=
 =?iso-8859-1?Q?/GGsov6LYSPiEgEldAjJdsP8fNzOWCxBdqd0cf7SshsVqorA2dc5b2mZyS?=
 =?iso-8859-1?Q?EhcEPJnuRJXpF9cCs62CV2ZXEQjTFqp/xC+9p90k2Pfs2WwkPUehhUOtBg?=
 =?iso-8859-1?Q?75jZPQizxzYrKc4BR60jL2bnknqQYnfuDMBxsvh5aTobZivaTrdj/ljCG0?=
 =?iso-8859-1?Q?v2wl98QlP0VwiBHQc7DDQl6rpFU/VlpGQJ7WyYCeJNCknvdY30k0vzQpwG?=
 =?iso-8859-1?Q?rnGGCY7K4y9iaj7vs9ojkexcEcJIxPu2OAvrrdlUku647DeH33bw21Bs7a?=
 =?iso-8859-1?Q?Xn46Rp/xaFlub92PVo6JH6gvROZpBI5g0ti3vdGrhq83oQPUlAeNkJKcED?=
 =?iso-8859-1?Q?aVMLGdOuv6Hp7GAhWxEcatm0/50e2pEinTx6Iu77entsbzNs+TSZxS4w0y?=
 =?iso-8859-1?Q?lb+kL7CAAOs7i98C7pvXzF6l1Nr1i5ffs2zpvIKhaW5BawkQupO5ti8vZD?=
 =?iso-8859-1?Q?kq5wp7A6RAxF6QOsJROzf4Esq1JxQjZlbuAkvVmbDBMtSulqgZ+G8ebJwv?=
 =?iso-8859-1?Q?BwmYzSGrm2GLZ4z04aCjOYNi896G/kW0quHQXQzEQN0yp6I41OwXj3GHcE?=
 =?iso-8859-1?Q?QAgyT16Xg2aLtXfHgpKsYt/P4XrICWR69etwe8OhfQjNHUBfrJIxlCKJ3c?=
 =?iso-8859-1?Q?TYzto8UF4kgOZt/NFARB2HARqaWbdeduVMOQ6hsSUximk6SonUhmJhzO0A?=
 =?iso-8859-1?Q?6vavXjBxb6FjQpG2GRG+KTQbaen4AqWInkpEcyh0y53mub9Fpoc0RRTlTC?=
 =?iso-8859-1?Q?eexKQXs4ydntrtxm2/1WZozB9rXEDQh+5qMg7QvWj3jeAX/nKFoB6d7x6O?=
 =?iso-8859-1?Q?o6Li34flIusf0uNFwcnVZggc95jiiln7nBNod93hcswk26nhs/K72WTvmV?=
 =?iso-8859-1?Q?Fxlc5b4fCcsDyF2XSJ3zc0Azk8+wG30AFr53jnvERDlxNAcLoYNJPeR7wE?=
 =?iso-8859-1?Q?ihD2RMo1l9R7EpHOC4dTDK7MuivGAu9dItHZQgmYKWyT1lj7NvCfTaBVdG?=
 =?iso-8859-1?Q?6wl0gwSrvVhnC4Yj3HLkyyGHbp+l/3wDyviL3Ufo5vtjyIcJS5tD65YEi7?=
 =?iso-8859-1?Q?inSgZw16j0qR1ZEqMXhWFpYOMDA7CAbfWy2QQFaOTOIWcYQnqdwuuj2/ti?=
 =?iso-8859-1?Q?F5Jn2Vp3rV3EVyeoGD5XPgqU9F8YtkUD7o65Jxb344Mz4cJ9qg8hhE6FuM?=
 =?iso-8859-1?Q?WdePHkg9H6bKWnO92vPEtTHl8RHWp4xGw8E6POfYdgctwnSTt5XRqw2BFX?=
 =?iso-8859-1?Q?v6obzuET2CszSfB+sAwPifYS0HrLdDY6F77RBb5pzi0Yi2YWwjZOy9cF+R?=
 =?iso-8859-1?Q?Jj45WuYJEye+Yp/krOZNv2voXMIfFuDjIeX9O/MvywENeM+SVLHgEaXP1Q?=
 =?iso-8859-1?Q?pgoQ=3D=3D?=
X-OriginatorOrg: eckelmann.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2958fa80-d9bc-498f-6522-08de3cac094c
X-MS-Exchange-CrossTenant-AuthSource: BEUP281MB3513.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:04:32.2450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 62e24f58-823c-4d73-8ff2-db0a5f20156c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBg2ARKmdgFaHBvDDuKpBZG2+97VXjgTjeXVgL6fTjcSUgvsehcqEhLsyAV9Mi+FYIT8MuZ2wAE/fRqX2xuhRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB1760

Hello Uwe, Hello Stephen,

On Mon, Dec 15, 2025 at 07:09:53PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Stephen,
>=20
> [trimmed Cc and added Thorsten and the Pengutronix Kernel Team]
>=20
> On Mon, Dec 15, 2025 at 06:41:26PM +1100, Stephen Rothwell wrote:
> > The following trees are going to be removed from linux-next because the=
y
> > have not been updated in more than a year.
> > [...]
> > siox			2024-03-08 22:01:10 +0100
> >   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#si=
ox/for-next
>=20
> this is fine. The last patches to drivers/siox went in through Greg and
> I'm not involved in siox development any more. (Otherwise I would have
> opposed 53d2bf583c6b6326d751d0f0dceba76109dfb0f9 :-)

@uwe: thanks for cc'ing me and puttin this on my radar.

Dropping siox/for-next is fine for me as well.  I assume siox patches
will still be picked up by Greg.

> Best regards
> Uwe

Best regards
Thorsten

