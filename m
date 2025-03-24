Return-Path: <linux-next+bounces-5968-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8DFA6DF85
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 17:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E87D16C638
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 16:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C767262D1D;
	Mon, 24 Mar 2025 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ct/3WLCw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="b9OzAQL6"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660E5261595;
	Mon, 24 Mar 2025 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833475; cv=fail; b=XNaAJFsuzb7pj9iHye2xiB8OBttXD01cYV9JD8x5EMVg5lV0zhJuJKs+LY+cQFTKiL8QT2RHhvA8oSLkpPiFMLa3grhTD/rnfHqZUMLxKx2CSpc4oQLvt1BpGg2ZVwvXYUqJ+k/NR2qJadV9wfWwTuk0rKffeXgfcpmZ6bbuyMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833475; c=relaxed/simple;
	bh=pzCKi2FkJUF8VSw6l7/xZmCCiFIP0fDbNOi4h3csP+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5oAiuZDH3G8pzwoyjeBLLP6I1uGRLYCBaBlFHd9/byfx+eE0on8YEZAc1/0Isri7zLebWXfgHRWqvzWe3DlyqQm45ayowFfZBqqqZKabquuE0m9P/aJoCLdDowvxiJHT+1t9gOyvbWWuePZ+/HOTqrEzMgc31nL0DJoGSN6/uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ct/3WLCw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=b9OzAQL6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O3RjQZ004435;
	Mon, 24 Mar 2025 11:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=pjlA+uouVDezIEJtRF
	FPHbxUVEG63eWEn0nxcX1aFIk=; b=ct/3WLCwOaNp7OfnUDk+LtCSaCXG7nSVCh
	ojG3+YXdtO2W240mkYTtznB99/2250cat0TUuXRvSL7kGtow87aKmG5KbJHA4d4I
	BoiEFluCP7cl+rcOf8sjOTIKqx6iYgGacUaoMBXtI86vYSRxln5rSYMXKvwGmHE2
	+neSo+Zdprg7C+7KWOQ31ou/D48LdwU6CZrOMJ8hmKtEj6dcDEqZLsUEeUsxkTt+
	bLH3JqRoTL3CXI8vOL9/aQuWOkai1RF/GLwUpHAxuE7jjTUDi5Te8V+DFnJjCiMA
	GTMxU4+e8UTW4aWpIbTHrKbXW8ZskRGLYSiHkaeZGuDm3Y/hZHIQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45jntbsum5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 11:24:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozctmCDeEupzKyQvhvVAUp5Kawd7aUt63ZqowICRsDXlpFQryj+yYuOD2e9zSF4Mnlmt7Cm1Qtyydc7MCWdbvpkhluwkjAHt/Hf9ri5xqsERaKPN/ciXtQt7R7V83o8WQb2/xHCWrHr8Qyq9nDqO42ufcsvcThSlOjZxjveYV6EbL2pOYIBOAK1PvA1laXmXs+SHadO2DKTXCVX6qag+9A1MfYzSnVOnebyoiqMlBeyABColcVpzAyewZ/tE1WxN4vMnU/OGynJLwFfEuesyAy3hUklOiwWcyZ6onG0uqpm+iHPppzckcXjqmuSpDW5mKwyiUdvFp5QilnSQxs+bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjlA+uouVDezIEJtRFFPHbxUVEG63eWEn0nxcX1aFIk=;
 b=RXKA+aHgacm17ePMiVn+myCMNTFVjSza7NZ1uBA3mqJbCdaVntqKXiMzKUF05b4+gQt/M0nXj1VUctenymcX60zE66ILK+oD/39peMaXbpvyrS4LSn5gmJLPk55LC05U4tCtd5d4yGKCagmX+X4IeGNw7GXewaVIYDJcHtKdrqblIgpmr2e//ZzFiRKXFaJ3U7gAa1Y9Opn8BJKRF4wbYAdkOuMkqsLhaDc3gWyUDRZAMP7tj3j8JYffT2SXZRKDU24FPAjcUwx6hVFwETGLImawWcz2rk4CL6KWhaqgiGVsmTW6QPUbuyTn9Awj0lVs8V4YIet+bDVvO0licrIsNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjlA+uouVDezIEJtRFFPHbxUVEG63eWEn0nxcX1aFIk=;
 b=b9OzAQL6WN6zgPJYyO7HHtEFSy1HXfR8I9G3UXPBVaLgsm3vpfpk/PzDAAnBKutJB4tRlUBA7oN+cLFo4QTpGNMs6tkUW1os1lDJZwYrKMwPO/VydPXKQKPU+cQidWp7+J3UUTHVcmk85dJjgfl9GAbE0uQBI9b6nFUcEtlilo4=
Received: from DM6PR10CA0014.namprd10.prod.outlook.com (2603:10b6:5:60::27) by
 PH0PR19MB7317.namprd19.prod.outlook.com (2603:10b6:510:281::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 16:24:09 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:5:60:cafe::6b) by DM6PR10CA0014.outlook.office365.com
 (2603:10b6:5:60::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.40 via Frontend Transport; Mon,
 24 Mar 2025 16:24:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20 via
 Frontend Transport; Mon, 24 Mar 2025 16:24:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CDA50406540;
	Mon, 24 Mar 2025 16:24:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 9AB91820244;
	Mon, 24 Mar 2025 16:24:06 +0000 (UTC)
Date: Mon, 24 Mar 2025 16:24:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <Z+GHJcUpHnttzIqD@opensource.cirrus.com>
References: <20250323212937.4f182bd3@canb.auug.org.au>
 <Z+EjXzXlocNTUQUz@opensource.cirrus.com>
 <Z-FlYC2Rg7eX1qxw@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-FlYC2Rg7eX1qxw@finisterre.sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|PH0PR19MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffbf781-4733-4eef-a1c7-08dd6af04d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0sUQfJ8JBdhq1eiU/pWmF4+lK1qZ4G3HQGbnohJv9k3guEwM54Akv6vS9zSn?=
 =?us-ascii?Q?8NqHfyQ3FFm5b+1pHk7X118VEtic03pRMiXEfCVJXs+el+qwq+K4ErFnE3yg?=
 =?us-ascii?Q?teEZ9+MYNaV2AKMfk4IXDLi6loLEwVpNVv+UfhlMTbBMmitDIacrrA2VgxaC?=
 =?us-ascii?Q?vUr3GIJg0804JIWZRFzO9T9U6glyE0lwNnzQxUce6K6p1r/f02BUD+Qtwr1P?=
 =?us-ascii?Q?eeP3l8rzmG0z3h/lo6TPE5T9V+Z5BZm30Amsp4j6fAeUMitU92lobK4sIhRG?=
 =?us-ascii?Q?PhQ2FAAh5jUaEdD5l7c1QyU9aMxq5uDwvBbkZVTTDt9daI89kWdNNqQu2Gz1?=
 =?us-ascii?Q?oS6tQ7YzoEeKdt6JmkSEfmsNdQEwL47dpmKfeoyyyRuXk94TipNJqxzAqUWi?=
 =?us-ascii?Q?tFUz/5xegI0uf/XUnCPWZwk7S+PhGATpuoCncVvq1/B6J33hLa2zV4yrZAyn?=
 =?us-ascii?Q?mN7KJRseRERGWy8oNt5Bc9oXCTYsZHYTIYWh7536hOEra2TcbjSYJ/FEIj4y?=
 =?us-ascii?Q?VWBCrmlOTxyjNpWYrmOtM5EB5R3p5NBQYdwx5FJa/P5+H8RUSl0qEy2t6lfx?=
 =?us-ascii?Q?uCC6fzSWlTGwi1GOkvYMdXarnod2yW7p/KVoJMYHceuCTKh8ty1+zEpO7Ef/?=
 =?us-ascii?Q?I+WQnKKleTkza4GHDEVxStIeZR0cdc7rg6Qm4Kzhc0+W596pNByrkMLlG0Wx?=
 =?us-ascii?Q?RJlqCYoDofgf6TGFv20kTDjC1bgz71ztqaIxwS9bBrv63AZkV8gMDKB2pBc1?=
 =?us-ascii?Q?aiTRNhXY5v0Ehr2DlafIMzZoDso5UlKtgrLUCtoYydRP4wCBSVPp2lWj0OGW?=
 =?us-ascii?Q?zs/M/Yowzk+bUXMTxuM6SeYcuUVjoVoH7+0fsqIOjj/SJCUohm4s2vEBGzmB?=
 =?us-ascii?Q?Sq2929ne/Zkhhf/kNBf0kMIceYjg3UeO+zDNANFmkRtS1Sa+8MbdbjoaLE0v?=
 =?us-ascii?Q?gZJHN6y8oW46fOBUdp+mO+G0KAhzI6sTXh2cthQixX3sCT3XxXs/qciJNIVd?=
 =?us-ascii?Q?ubxdjTl38KFATcgm0pvZLvci9G+Ji3xGQotx1ChSvs+E1FhLCqEbWEPL4yrN?=
 =?us-ascii?Q?S0FvYcYebmyQRMXYLbNdonE6kn5/hq7E/HxCBCIxRBnL2IgyTx5AbFDMIUom?=
 =?us-ascii?Q?xKb7FZ5ojHwhtBKtGtabQqF/T/Ba2gpSgf+lIHCYxNXmjF0sMtAc+HDHGDex?=
 =?us-ascii?Q?boiVcF02FAa8ZSM8VUcXlBl7mU3r5vGGmQdH7PHYj5dKPaRAM7Tuq7etYt3q?=
 =?us-ascii?Q?PkMhyYFTYARL96geC3zeCmuHs8EX80DKJ/0zkrJeZwYGfNmghfQEyTsemVwY?=
 =?us-ascii?Q?wOSZE3/UuVQE6ckghb6/AHKCsQrVQyHT/X4poT4moLnuE/lOWVjWqNu9mRlh?=
 =?us-ascii?Q?oVQEmIZjrfmAk7k4uTiHzn1XCF6myEPPWsPdCiT3tEbro+BDArPkfWCeu5jl?=
 =?us-ascii?Q?oxsh/0JTTwvGdD9UtDTCzFoPj1KAYp7HM0IPw1I+6ME5eMQK9l/U1wS6po8X?=
 =?us-ascii?Q?5SZZhCUQUJ+uHK8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 16:24:08.0014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffbf781-4733-4eef-a1c7-08dd6af04d95
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB7317
X-Authority-Analysis: v=2.4 cv=JJM7s9Kb c=1 sm=1 tr=0 ts=67e1872e cx=c_pps a=bqH6H/OQt14Rv/FmpY1ebg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=MiM1ohbpZiBkhfQtDbEA:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: fSl4V8kejAYrxGlAcBuNzFGUDk_PaseU
X-Proofpoint-GUID: fSl4V8kejAYrxGlAcBuNzFGUDk_PaseU
X-Proofpoint-Spam-Reason: safe

On Mon, Mar 24, 2025 at 02:00:00PM +0000, Mark Brown wrote:
> On Mon, Mar 24, 2025 at 09:18:23AM +0000, Charles Keepax wrote:
> 
> > Bit weird, not sure if Mark is in the middle of re-ordering his
> > tree or if a script has gone a bit off the rails there. Looks
> > like it had the right SHA when I sent the patch up but it go
> > changed as the patch was applied.
> 
> I don't rebase so it'd be very suprising if anything got changed in my
> tree, I'd expect to remember if that had happened.

Super weird, I mean I guess its merged now so there probably
isn't much action to take but really unsure what has happened.

Thanks,
Charles

