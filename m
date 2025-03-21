Return-Path: <linux-next+bounces-5919-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3AA6B4B1
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 08:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 784C017D7E1
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 07:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162911E3DDE;
	Fri, 21 Mar 2025 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b="QMmbwPJk"
X-Original-To: linux-next@vger.kernel.org
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B212200B0;
	Fri, 21 Mar 2025 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.141.245
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742540962; cv=fail; b=ddGCkeF+lcW7COWHEpnoAAfeyafe9OMOpoqZD6jHjQlaSxenSrmuyOAbBnnPWcPDMgR2YDcx8yt0i1ruRoJa+F/jKleJ2EDVkXUXx6mmk/f5n6HBfYSrzUpDPzp2cjjIJaSjjjDkxIRTgqz+P/MB/9dk15AwUQA+44zcIeFsuhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742540962; c=relaxed/simple;
	bh=yPAa4zYtRwaLaIR2o2gXRBiGYzofX/DKOqBozPyYkK4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SSACGl5Omk5L9pPvJnPhim1UQ9GiBj5FbocrMbxusVlVQTrcStzkhsmv3+xz+HPISGnqguRtMtuD9S2Cjn7Fdc8odRxU6J7mVHhWQH7gnILzlKrhlWaxlexRdX5tHrIPgOi+c574sb87L2pJc8SgpuIZTro6xNZIsjQiWb5jhBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com; spf=pass smtp.mailfrom=sandisk.com; dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b=QMmbwPJk; arc=fail smtp.client-ip=68.232.141.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandisk.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sandisk.com; i=@sandisk.com; q=dns/txt;
  s=dkim.sandisk.com; t=1742540960; x=1774076960;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yPAa4zYtRwaLaIR2o2gXRBiGYzofX/DKOqBozPyYkK4=;
  b=QMmbwPJktYwUwoGv2MjjuLFLavA/MdFJUJgF5Jt7lmBTxbIJQ+yRBuMK
   6nyk2+0VAfAws2N+aP/BtxKxTsR+SDzpYf7FCGbdFgfjaaYBTTAypHH35
   JoVtxSJjFDjySm/5egRjxDtPvbsi9RyBqKd46+8Q6mSYDP1bPZa9DhPRW
   +CEXbz1ADCSHlgUAPyklpYgUOVoT4e0gg/D33lBwZotxOXDwyc/WjqbXf
   41nqPJceEtmsJNkjzLj1yiFFewl8dG7c0+Ixj4Z+uPEKy/JxZQCyQ1CTf
   azIGox+9Ghm01/eQEMq1DTQ3yUC3by3lvjj66/ViK6vl0rckC2GNLlW++
   g==;
X-CSE-ConnectionGUID: 7OovX02AT+aA7RAlNxlhTg==
X-CSE-MsgGUID: N5L5YIv1TwWzbX/y7P81eQ==
X-IronPort-AV: E=Sophos;i="6.14,263,1736784000"; 
   d="scan'208";a="55827108"
Received: from mail-mw2nam10lp2043.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.43])
  by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2025 15:09:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weMOld9Dm+8OLD0OK55Tr58ftD3WQB8EOQupxnWPgGzpMPh+t8QLq0Bba1AY7R0K5figdeldS3JEeGCYWxLoTCqYbys1CxNi7xwfY/GnxWVAUnVW3lGe4kT54SReysqhU3+ypBXdNEJEq9B0qBOew49ql7bBUm+tgr2UB/MUs9sML7jHYtlCVEf/YxzzimnZtInyImmoybSy4zxH3A0TxoqcP/P8oWA6C3sJL8pKRFmpIDpsJO+w8ALuBDkTa+zhK7ovlpzOsWRM/Tx0QJZV4zZigy/Pq+yhTf0w5lWnC9KLj5VcGZo5yUxsOH2BMq+UK8+2OaduM/G2FAAu3kyXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA9eq4g7wV/Lm4VXLB1TjrZVMAvYHAFES/j4Kzum11I=;
 b=EKZbJYxbQ60UQLvwrC/hVMrpDNm2dgsrN32n+iRfnvZtcMTyaz1uZINVZOpL4ADJGXyvHoZsLo9TDWFrVF7MJg5En4Z18lmQsqWcVimzL0pKVeFml6jfmMkBddE9c6wxhpxYkXBWD5hI75gFOnlNGK+o6gDluzNG2d8fuUsAaorM8k8cc8o+drCPQ6aQHodnk6O9PgOcK2fudpJ2fWii83nLq1wBFSoCKW2mBiTenLb3JNzWW8rdg0zz0vEtcryLr/kV4KRQZcUJFI7ZASZAf7iMNWotlc1Ar0RELsu5A4xkIHcA69OAIqF/roVBDqyqEeiFcUpxqyoBUX7nVoQSaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandisk.com; dmarc=pass action=none header.from=sandisk.com;
 dkim=pass header.d=sandisk.com; arc=none
Received: from PH7PR16MB6196.namprd16.prod.outlook.com (2603:10b6:510:312::5)
 by CH4PR16MB6699.namprd16.prod.outlook.com (2603:10b6:610:22a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 07:09:17 +0000
Received: from PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::58f:b34c:373c:5c8d]) by PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::58f:b34c:373c:5c8d%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 07:09:16 +0000
From: Avri Altman <Avri.Altman@sandisk.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: Fixes tag needs some work in the mmc tree
Thread-Topic: linux-next: Fixes tag needs some work in the mmc tree
Thread-Index: AQHbmdxfPFZYwaoBUEOHdMkiGyQTfbN9K+OQ
Date: Fri, 21 Mar 2025 07:09:16 +0000
Message-ID:
 <PH7PR16MB6196A1D9A7043FE4E69D8AFAE5DB2@PH7PR16MB6196.namprd16.prod.outlook.com>
References: <20250321080918.1f8b90c4@canb.auug.org.au>
In-Reply-To: <20250321080918.1f8b90c4@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandisk.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR16MB6196:EE_|CH4PR16MB6699:EE_
x-ms-office365-filtering-correlation-id: 49dbaaf0-e3ea-4b80-8f7b-08dd68474b02
wdcipoutbound: EOP-TRUE
wdcip_bypass_spam_filter_specific_domain_inbound: TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vCbv0aU7F+6ts7naiuSOUgAd9UZvou5ngoKNVSRBlxeE6lrcrxB5zDgdDrdz?=
 =?us-ascii?Q?vdTPjr6smPYfd/pWbpCSxGDX0q79AZzxEJh9LH26F4hyTHnKkFbyLN+ZEldu?=
 =?us-ascii?Q?j2X5rEUtAfUE3nJD+HZNQBcTfxhcfVPavpsDcoSB4MHzM/sn1S84kEPcyqHJ?=
 =?us-ascii?Q?EhYAX3F0TC1DpASwPvcysDspKrj+EqN8MpDcHHNzKNqJ+YHqWHyYbXRYQL8o?=
 =?us-ascii?Q?pFY7Ee7ayS/GpWJRmpWM1jOG6UuY04Pi+HD1Z7vJUfDbjvmrNnQxsE20oTlt?=
 =?us-ascii?Q?vOC2nYKXSj9nMPWXgk5ZtKr+SQ0rbT9010VKc+40Z7fQE4/+3wBmSSlbJQld?=
 =?us-ascii?Q?OGjbC3LtQrlZcRTN0YdDbGUfZa4wzK4W58biUnMjeFgU7oE9ZTQ+fGhO22bx?=
 =?us-ascii?Q?CyXuoKk5zMELQn0SvkPuXiLAvH8xGDxxYjtItGNjcva81MiiaZQQYA896h98?=
 =?us-ascii?Q?GeOiGYS0uLW/sPkTRdzaA4FOxersZ3xhqqlo8MQB+W5ORTIed58MwjKdHcYh?=
 =?us-ascii?Q?MC4xwG+MCOx2HEOaA1sjh4zvplxpuW8X8+OFr+Q9y/aQ+7rT6qpUphWLJIvh?=
 =?us-ascii?Q?FlcjU+DdwkhO3VkOaxiRuIBu/XlkIS+2SAVqMgIhDp2tH4Z6WzwU2ymKHzcQ?=
 =?us-ascii?Q?bgxBdvXpO+IucEXM3i0Xg4tE2rqWKLWzZ2Ru+0uCGQhqp6ALY0MxMoliuuK/?=
 =?us-ascii?Q?CFJzN7YKTYEPHjC5TpdAtDArC6U0fwn/SpeFYYQOgkLjWvJ+nu8PQO0nlXaz?=
 =?us-ascii?Q?WIp5/sUmpuJD/IClGS24sB+Ddv+016XCuNy2kn+Fwf8/5G0hp9e4IRYTNyuK?=
 =?us-ascii?Q?lBqyvLEKlwkiMnuRafzRcD6I5GQaX8hl5t4mJUKaYHzWXiYqHIxTJES2NwHO?=
 =?us-ascii?Q?RBA28XQUY8treTa47zV3YC53qz5Ughg76ugparZ7r08UK5XBFWQrjo/hnqT6?=
 =?us-ascii?Q?7P66ZBqlJTyojc/cGUHix+IWJWw79N83xAYyqHgf6vl5foe7eTR5rGJ7Byfq?=
 =?us-ascii?Q?gntkULwYAoGExbp22sGOztos/8PxvyzlT/Poh+cHtC1QqKH0svTYfZ+oWGh8?=
 =?us-ascii?Q?iAQsL+cvcSKpsELX5QjjuDDgUVP7+9NkmVKdwenNHwm5ItaSiSzAnUBYiDmf?=
 =?us-ascii?Q?+8Yu+p/RjUjL0L0T4hnYO8seH7H8QMGKAhODrNhV2pgR6VZ4uQaSvCcNFK6U?=
 =?us-ascii?Q?LR8xS1o7IJfjE3y7dXJlcUlrXsxt9mzyfPdSPIraye+VDkLfeN55x/UGmdnq?=
 =?us-ascii?Q?QMydT9H0v5TK4l7i4ap9+rpJPbkBrrYThJrYbjxYW6MuDH4wlA0Nu58hf9l1?=
 =?us-ascii?Q?rC2NbkjQuFCBTEHsYGrkI3fsLMtEACepjyWPiz1qpViBids6tg922v3SBFal?=
 =?us-ascii?Q?0Nw0XflEQiOv7PFaPycBRdLYeysAHyar+gK/QdMgrzJOOKXiZC6p57IZhABG?=
 =?us-ascii?Q?eULE2+6cEpGmV2k7nsTueNRJaTdewp3Q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR16MB6196.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HfnA/lq/sgpvaCOaEpTuWdfOfo10JpiJKnc90oW2hJ6QuHgQYEVmCX4wR6t6?=
 =?us-ascii?Q?/96h6C2VCJe9zpxT1DvOBRR4Bw5GEOdrZvRmDmNkwJS1mXQUmrrkD79A6Qk0?=
 =?us-ascii?Q?7Gn8TZ+295HkEQP6zph3+TvB2JCCVXJddvqQF6BLGOPLDOW7wm6B43mHsnU2?=
 =?us-ascii?Q?UE1UaXloWx4uAJVv6Uqqlzzx5JVSts1y7dY3S2qzHQxTdb6vEvadIOEUOVAI?=
 =?us-ascii?Q?jV/40Vb7NvB7xydnCohFWvJXSmOcfhNT1Pc0jLqJ+XNHpoNZUnXjuIaDvwwC?=
 =?us-ascii?Q?yoAIJSoWQZVqBDZXgPE+B/NRXEslmkA/Q+Q+rtbPfCgrfkCGE65IIkadVwbb?=
 =?us-ascii?Q?/pWn9JMjiEl7E/buLLQ/jB6imq/3ISuO9OI3sNlUyJff7AfPdbFvz39KRLns?=
 =?us-ascii?Q?deGp9aOXcBnUPqgzucby50Hnmj3jYsH9sVyHg8KXnV4p3IE3tOf3vDmJ2855?=
 =?us-ascii?Q?dgByw7d1kKwHYHosYgdBsxb7s+t4xnQnw+cu2csj/lG0SqZm0FU8cUH1UD5F?=
 =?us-ascii?Q?CLERxjSMc8lUS/o/qT/DcNGF5pg9nBLGnc0/zVnJzBhwkWbzTf/QITqmGlj/?=
 =?us-ascii?Q?OadSOC9ERJvr6j8O7UWx5lZCcaQ6z5PsryUK4O5Olb6t++s+PLYk8Sc9G+QL?=
 =?us-ascii?Q?w5fDN9QN/gF3KTlfiCPIBdj7Xit/KJI0IsXzgkQQRNSHB1HEWIULBAmAKtjD?=
 =?us-ascii?Q?QGk2+kV8Nk8+fLrcPFFM80FkOobyVgO9H44kLnzoc6+52Sic8Dvk9shgHVtd?=
 =?us-ascii?Q?KtX+yahKKwlWV6zKsIgHgOzGlMTSbQpYj+rGgXI+nfCQBz2YTg6EUpUX3IoR?=
 =?us-ascii?Q?Orneih8hTMRb6Tf+SLizD4ZqluQj5LWJL0E9v8jrLQBiQVZpBnVcj4tjp70f?=
 =?us-ascii?Q?Wqh1+QR8Mdj8RjKm7oRBIPeY1b1yGJ3AVNjh1ltrjA2+2fDQQ6+EMVuXPPC7?=
 =?us-ascii?Q?NWYfKNp8DaCj4OBTVszSp/Q/G5wcDI5ylv2dAV10Z18TXYISqun3PVUbK/Rb?=
 =?us-ascii?Q?ldExEvQkUIMjYSTO2xd3gKbAQ1cHs+FwXOZdS3Im6yijeQigznclkAgtET7Y?=
 =?us-ascii?Q?9gAn9yBRmUMEJK3yo0A2CvTDUrNqWc4rZijIRLVOGZojwRQDLQ12ElKBkona?=
 =?us-ascii?Q?wq6SmZjnczMODqJ6L+OMiGWxSvkdzFwdA/PaCvs3I2707aCwRqLu09/INYde?=
 =?us-ascii?Q?vgp6wzYW1K/RkdKu26k7+dPELc9E+BUMqCL0AGst7bwu881cAGB8PChDtaQd?=
 =?us-ascii?Q?X7gSsQsiXvJsTbletzLSnC3kxj75WQUsxHttfzgdm/iOzfDJ2P+yS7kWo5K1?=
 =?us-ascii?Q?KJvqHZ0RJvv/5JybbZyT9XmgEeMszN+pjy4rVUpJ5LRiBxhMI2+AX+QRK9tL?=
 =?us-ascii?Q?EZOhS5HqHHyKdBhR33zA3DhwOkgTcXGNnycDqN2dB8Iyu8SeUIN/tSIbiT20?=
 =?us-ascii?Q?Da47qhEJ/6kBr/2K6b75RB8nwpRZ2nWH2QbypTE2eoklcMGcP2E/zj5Augf0?=
 =?us-ascii?Q?INURZ+UlRM+/vIdkJ7oMOmaiyd7ItrLJw3hNGIl/oLUmAE/XdvEZLEsicaSh?=
 =?us-ascii?Q?K3LcfsuhwrMktvlC/BUw4+L65qKTDlY+5IOIxBloKu1825xSRV/aCJ3a227S?=
 =?us-ascii?Q?4b1XbTURvVX0pzUukNhSgtrYa4coZGaWWPq9xnFoGPhc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CR1asEm3iNRqW6Ikuit1S6/3cqM4JEtH73ZT7G+lpfRcrZL4fuLcxxMrjy+bywoaCLCTTlyNjHIPBsideK+3R9hgstiE/zMWbW6vD1oQk+R4oSWlrCwu/zKdv7pE8hF9yS/1ZJtdypjIBEyU/ZoGoeVPaaBjaQXQNOKUv0X/w5OP3UhDFjbjEylWcsOc+PHSqoD8KuCTTxFCg/aCab4/HmdHOpkCdBpP3CICq8A09SwAOddWMjqnoJKJh3snAFApmAyHRimtampmTi6OsMCx5Zz9lGYXaWIg0qejC6yquUrSt/oZOEkZUqGjLe3Qjk0Y423H5VA1sgA2O7fZCiEckeji667tQ7tC7pqQfRFZsbP31edkBZ9Mpp6rus/ji31Mrkn8oo83gKhe/KAgntUTRcV4mbvTyWnzaQorA0UCaOVavre4in7FFGAw1AzUtA7SnYLwA4mgwyJj0EQX8J4YxniLvNmIRGBfeTUkhzjwX7AMC5ymQglaqZ4X13WPaK6N66lhrdftdyVjF5+NmHSXaHMKCegJPvDv9iW5pnxomFXWJ2PE/J+264EKP2RTobSF3XsGKcP5XFIJN1xtOIKDLaefe/GNgX0Jk0BgtwbI5C9+4mo+F3pRRBMaAR+XXO9saDkfCwdf3z/XcjHED6XVpQ==
X-OriginatorOrg: sandisk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR16MB6196.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dbaaf0-e3ea-4b80-8f7b-08dd68474b02
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 07:09:16.6594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ffe0ff2-35d0-407e-a107-79fc32e84ec4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sV5+XtskTxTiphtS+0r0GmCp4iRSaAliyltE4qR5rmH9OzgIxxCCuDs3MK9j/yc5a5lXARxHPmhnyiUdO2m5fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR16MB6699

> Hi all,
>=20
> In commit
>=20
>   79055e47336e ("mmc: core: Remove redundant null check")
>=20
> Fixes tag
>=20
>   Fixes: 737d220bb2be ("mmc: core: Add open-ended Ext memory
> addressing")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
I was using Ulf's for/next branch, as I always do, and their the sha1 is 73=
7d220bb2be.
Should I be using different tree/branch ?

Thanks,
Avri

>=20
> Maybe you meant
>=20
> Fixes: 403a0293f1c2 ("mmc: core: Add open-ended Ext memory addressing")
>=20
> --
> Cheers,
> Stephen Rothwell

