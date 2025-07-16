Return-Path: <linux-next+bounces-7586-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19179B07D1B
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 20:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86D811AA351D
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 18:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E65239E60;
	Wed, 16 Jul 2025 18:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LVuKUsXE"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB44136347;
	Wed, 16 Jul 2025 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752691529; cv=fail; b=gAtLq0qAA3evW+rH3exzZkJiPInrc3oLOx0ZtL6ekm/NUwcjBKSF7p20O1AeV1Ey9Ykc9EBLtr5VImltbLpXTF/kthw9fYl4UYRCQJjOpFeKSXeAsARq++R1N5gVA0w1Fp+IdzLsnULVXeiYUyZlZS/LPdr9sbSYPOBnwG1lGBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752691529; c=relaxed/simple;
	bh=Ioi4JavdJlMryVN+peYnxtvEOMP0r/L3K2xTL9cZ6tw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PqlrQpLr7eeVD/Zo6QSLOhL1K18R5MwG3Zpu0MzhXmIy958BbdRqJHEVokcJ4ozS19RKb2PUuvpOazkulyaXi18SkvSxPKjtu06JpbfiEXb0QWgfcHFdvSGJzw+fulmjSFOHIDCn57ZqewBmbhuzSibjHoHXi9NzeYy0XuWIM1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LVuKUsXE; arc=fail smtp.client-ip=40.107.94.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQYHwATUm/tEHQm0wBRPH4Cmu3zIdqpmxkOw0Qdfaqqb/CuyoDpRbOBGEnI2PAwh6ZlPq9g2mQj9GKdWFo1OHNnarhGjDH9A8F0PLHpKeIR6tzKCUgq95CG3D9LeAVSyQkWTRsO+wRG/dV6812hgQw+Y8qsHgIm6wA5NnBoBTbGQtbmbHGXvxPe9SQwUQ13/ZaglSf8gKx4D4YN4dIZTtC0hdQA7P6SzeoAltfO/wmHQWMUVaOsNm+pm8A7/AxJ3NzNMWMP2pqKk/br9Sn7PqdhfjzDlvy9WpANXbPkfTyEziBbL2AW9duBJQWSpYtdR0yLgetLBuBc0Z0c+NtsSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FTf1O4NMz2P4p3rOYb10jiYvzSG7t4IoEiLevgn0R8=;
 b=NMYIid3FJah/E1MWRq//t33MmYVcrH7RH1OaXHwgkUt5BWV4FWs/lZhN8vURwu46j6c2Kxsdq+wtAZjqH6/SCPDu17bhvkgyxlt3mYfgEdwfXDW4XgWs4r63IGJ1lAs+TFVciiudt9+NMX9W0lkEAKa00RwCRf+8cQrdSLV6r4NXivPcdeUAchlpvm9kP0Mwu/BnHDrSCsB9Qu7uLPdm+oyUWPkDpQMQj9zFYr81qp3MAQ7Q0Ef6B1OHz4+lBZ/Rz/w/qLJs19qm11Iv/ake1ua+vi5nCRgu/7nur8PyzDgbgtZlKR5a0F1fSym9UkVE96ZzNVIM3/GyZK0NgOtq2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FTf1O4NMz2P4p3rOYb10jiYvzSG7t4IoEiLevgn0R8=;
 b=LVuKUsXE6OKyP3eTkXQlBhgfWs56R0HTKinoEK4H3qTjHcpww83wp2JrnrAw9QjM1Q4Aig189plmLkBu1a/LzBCrwGxn93qY/kZEfx3M+m4BuSJha20xbUc/acR86c25IcWc8cjPNuXv1R7RkAUlxTFLVPhiV5aOuJunNKOUDD8=
Received: from IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 by CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 16 Jul
 2025 18:45:23 +0000
Received: from IA1PR12MB6044.namprd12.prod.outlook.com
 ([fe80::b62f:a186:3978:4a57]) by IA1PR12MB6044.namprd12.prod.outlook.com
 ([fe80::b62f:a186:3978:4a57%5]) with mapi id 15.20.8922.025; Wed, 16 Jul 2025
 18:45:21 +0000
From: "Zhu, Yihan" <Yihan.Zhu@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alex Deucher
	<alexdeucher@gmail.com>, "Hung, Alex" <Alex.Hung@amd.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "LIPSKI, IVAN"
	<IVAN.LIPSKI@amd.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, "Kazlauskas, Nicholas"
	<Nicholas.Kazlauskas@amd.com>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHb9jxmRlZrnVblGEiPsy7gdg+6qLQ1Fpwg
Date: Wed, 16 Jul 2025 18:45:21 +0000
Message-ID:
 <IA1PR12MB6044F52C3C58284B49DD77DCE356A@IA1PR12MB6044.namprd12.prod.outlook.com>
References: <20250716202831.68661f12@canb.auug.org.au>
In-Reply-To: <20250716202831.68661f12@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-16T18:43:37.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6044:EE_|CH3PR12MB7593:EE_
x-ms-office365-filtering-correlation-id: 254376e1-b168-42ed-aca7-08ddc498eb12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?GiGhQgmwlQknXGmHa9XWMveiBMpYtiBi7gXwH1clfsPTsb2W7rtHh+bIfRei?=
 =?us-ascii?Q?n1AeQq/louswXo0MXznFELIPoSp93zgcnDK545HSr0mDX1g2zSJgtR/j2aE6?=
 =?us-ascii?Q?xGGyIXy6UKcjKVQRA+YJND4A1lhk+Z1NBfMyWPubMWHIAD1d655BobMdgAy7?=
 =?us-ascii?Q?lM2X70XGtiP9IEETbZOEHHkKbx+0VomxO0Sb5UKmnZIqYGjQR6e29gzr34Zu?=
 =?us-ascii?Q?oQ9cl+urXV4cuUcx9p+lGf6wseMxihLyd85GgN70kJIWLu+3Z1U8+CzDzcqC?=
 =?us-ascii?Q?F1tMs2buVzpwdiZmbsrvmJH9fVX3efl6CkeFVxS7hH4uA3sgz4L7kAFDguUI?=
 =?us-ascii?Q?uCbNmIbvprVvTFQk3HWS6XlKJ0Bv1YgMsfVvvtlD6lLw1UPVIXT2rKfGiC9g?=
 =?us-ascii?Q?gxygzakdotR0NLuj0fL0AUEFc+h7271yUk5WAY6128O7xjSHGCLLY5cnrB/q?=
 =?us-ascii?Q?TAD+awVJxvdi2frUzxSdk1EPKzvzJxj1M8HPE3+tTE/+j0CuPAdswSW3V3Y/?=
 =?us-ascii?Q?AHj+F1p1KRML1kh6M25sXujtavcrLL8iOH3nzoA4tArYPCLaNv2Tyf3kO4ca?=
 =?us-ascii?Q?SgaltHRLd5k/7d1ouxIi8nC4mDgcWNg1SjYOuXSk842fS6JdlFuqbceFEaOH?=
 =?us-ascii?Q?Zv9rIXFDb3Yn1Q/a+2ujJKaQfbwJ6xo+8u8N31bhbBpjEHuqp3WTtGgsSjAH?=
 =?us-ascii?Q?x7xS0j/UPUIRDlkzTk5tCkb53BBhV21aKcdx+pVNQ3rr9q9C36GWR/Cl9fQo?=
 =?us-ascii?Q?DKCbj5td3NswmEZ2dN0EHc1spjw1nxKWhQ0eSM795en8Xf1aGvWGMTm+j/Lr?=
 =?us-ascii?Q?S8mgGysw5yDQkxAsLf2+mrt5Y88XOh08v7x2vWRr4HPbj8YU24RsA9ZhQvhG?=
 =?us-ascii?Q?KhaaFbp/y0BSLS3PVPdrB+nKNNbItPgiQWcg4DUfZpXdZzthzUT3+UvCKXb/?=
 =?us-ascii?Q?xbRaVJzTG7SKrODGK3B05DVshgFWwZ+7PMfsIqNqN3DANXa4Y+E7HsKBt9f/?=
 =?us-ascii?Q?Nh++MkrScFysbynjqgnsWxP5KfhPc5lgNpNsPKXgw487xdCtxByDKzhOSMKT?=
 =?us-ascii?Q?2FtCYm8pizxseXnmIS3eGaupqQSkPhy5hD9yqFyXSSTCO3sDhMU0YnFjDLv2?=
 =?us-ascii?Q?mVV+ySCv1hZZn8e3tfrwZKKEQJ0MWgmNaoml4M9EnYRG+5xesWlUNiW+7O5t?=
 =?us-ascii?Q?tdmSSoYItQCoO29LF+mNf0+hP5Fd2xp6gpaCdx7yyvYZfyY/lwACnnCDM0t/?=
 =?us-ascii?Q?wEyAlofGQvruYVqSZXMR8N6A1jZwZWoNdpZWoJqajAfQfceDFAeAq3MAq9Kx?=
 =?us-ascii?Q?b1BZdA3IptAz3qQmXXSOjT0f7dZZvAy7Md9IFjG6yHWXrKpNyOK0FyHdMWsS?=
 =?us-ascii?Q?7wNUVUX8i3BQZayzPF9LVoNDg6O5Ud3d09BIhaMBO9n3JQN6eD2pnSQo/48N?=
 =?us-ascii?Q?L+g4jt/NYlGG3KE1QGWvIZDv0LGuNboyAtntbV9h52MGR62NLmlEqA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6044.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ddcsr+3DjZJs31DvfRI+x3XqFjYOgcNEIZmiqiarXILnwaGpkz80xqXaxHTZ?=
 =?us-ascii?Q?746rXdIsMmN/0eRrx9htYDS5uhJy6Z1eKUfjINbXPBdkNntdKwwYmt/reCjK?=
 =?us-ascii?Q?rN5GPTIguXNZTLjkZ0gqiQeCkbT2rFVOJcXvNw6/7HHhgZAUge68QjnB4z3E?=
 =?us-ascii?Q?5zWs/egRJ3z6lgRpyuNiWhcc8mFQBcaB9BthDEi3l+TAIXcNuKNgGuj3glFr?=
 =?us-ascii?Q?f2TWIDSOfzHhOkB8VaR8YqCpJHYAKu1zlkAnB3PxYgh1NeSuwYV39CKZ4jMq?=
 =?us-ascii?Q?0WiXFJQhvJXuZXfmIoEP68zsBprcI6WEedEBTDZaGr8ddZrV7LvrLhNS8sE/?=
 =?us-ascii?Q?8qNOD6mszuCiqUk43UXSyEZaF3HEhS2O1HAHc83o3JNXaV9yfqpgGfp5n7hl?=
 =?us-ascii?Q?AhaLJeIoN0uNt8YQcNLzjLbruWhEei/aFobgbuj4FN08pqPKrN3kKW+CYRvh?=
 =?us-ascii?Q?j9F6GNlGCzO68EEs03HNfQqN/sLMcYBQZ4q5FkWjlxSE558KmI8HXeiANk+y?=
 =?us-ascii?Q?VEkyAMy+0yXX6KeElbnLFZXHWRDw9V6bLAduzav5leayyqLahvMY+pazMmsd?=
 =?us-ascii?Q?ddOOLVJ9vx2QviGe4/aqg/Fu5uMTxoaSlrnbVi+eXa3tgK6XBAYQ/QJXhPLR?=
 =?us-ascii?Q?c4yLbsQzsoutHps1X8+W4jdSwIFhhHWFTOhxLJHz6rWUDoLlgg149Iz2bk/y?=
 =?us-ascii?Q?SycQiM0RUGW3icf6O9feth75ssZhP6AguOb8Jvn6gSaq3JJGaFKVF6AGjZ85?=
 =?us-ascii?Q?S1Gwd3HigeQqTswWZWhqdDrwAZNwRUjyTZEO0EszGp1IWBHdgE5U/+Wr6FYs?=
 =?us-ascii?Q?gVUuna8sCKcI59OcYmGqANFDZ3PaiLW7cYMkfQ/AVnMLCoYfoMW5lFWjcA9m?=
 =?us-ascii?Q?/34KnqfHODJXZ8bwsQ0vNTioKO6Dbog0FtVYdbrQKE5THbKyYtfFDT05QsiH?=
 =?us-ascii?Q?bElqSyZvqrIgOJrD093tPxOisCp1PnVIVMumluhgZ1kwQUfMq9MNhgkWOBOt?=
 =?us-ascii?Q?jQv1dgF2P3jvUGBXYBn00IfyYpSP7BV9CTXto0Bbu9olrfBLoG+exGEDyAvR?=
 =?us-ascii?Q?sLcf9vclnjOpNEQ/hufFp6y4F1oHmET4MM8+przGvJeWPgrvo1+oxIv/r4cr?=
 =?us-ascii?Q?7L5JzbxsiINjC3GmLWhFb4l6A2Ec0alL9rFcbpRDXt5E4ON9B5mJliDXTxpX?=
 =?us-ascii?Q?lhlBWzKZQRLEZpJ0HjIJ2mNrcq3Nehwt6Q6bYXyu6m3Ux0BcpHvV6ezhKvGy?=
 =?us-ascii?Q?mQoxZUqCv0L6PlrgYhNnhVhEvpX6pawisRU9K+eEjNdWHf/1pyb1sWCeb1En?=
 =?us-ascii?Q?ytu80qy+xYHfFjZ6jyoCAuIQ7WdySeAC2acxaDAsa+iGVTfQbRGtflduoXe2?=
 =?us-ascii?Q?2PDgLHJ5w5Q5r+JzUvrI5W7Z6AvAzt6Hd3DdFtDSHw2yDTIaRxxB22Xqh3ZZ?=
 =?us-ascii?Q?EL3pc8SgvMxgdQRRFk6NW0LO0q4E25WPUF3V0RDcemVg2sqKDkqajdNi4+mS?=
 =?us-ascii?Q?Ybt3xPCLT7tushaPPckDBZ+4JVSZqpnB40DvLSuuK2F9mujFJTSua4opDmjH?=
 =?us-ascii?Q?/9KvstCRIzgngc6pA6w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254376e1-b168-42ed-aca7-08ddc498eb12
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 18:45:21.4313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWhod8TX7GooHnLZM+g9kqxXDBfmE+LxVj4V/39Nl9sBr53HkYUF0/xmqiNd1x3ZMA+nAhdSxDngp7gJkzn4cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

+Alex Hung +Nick for awareness.

Thanks for the information. I believe Alex helped me to add the description=
 in another patch. Please let me know if any further actions from me.

Regards,
Yihan Z

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>
Sent: Wednesday, July 16, 2025 6:29 AM
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; LIPSKI, IVAN <IVAN.LIPS=
KI@amd.com>; Zhu, Yihan <Yihan.Zhu@amd.com>; Linux Kernel Mailing List <lin=
ux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel=
.org>
Subject: linux-next: build warning after merge of the amdgpu tree

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs) produced=
 this warning:

drivers/gpu/drm/amd/display/dc/dc.h:255: warning: Function parameter or str=
uct member 'num_rmcm_3dluts' not described in 'mpc_color_caps'

Introduced by commit

  26ad78fffc66 ("drm/amd/display: MPC basic allocation logic and TMZ")

--
Cheers,
Stephen Rothwell

