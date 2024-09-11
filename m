Return-Path: <linux-next+bounces-3760-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA359753D1
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 15:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 076A21F22214
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 13:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36CE1A01BF;
	Wed, 11 Sep 2024 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Pg9Btt8z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ySHbpms6"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF461885B0;
	Wed, 11 Sep 2024 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726060876; cv=fail; b=BydyPtrbFwTYwO0WyHAcAJSTXnp4uSwGTZ/kZV48WFchxkYdsaLkyy68yC0GeoFbGJ9d706k/tTnyvFHQbyN8i7vN5po9gzjyOi5yaIgOby95rHzOTubeuKeuRsTUW6fYckzNGISr1lU13XCrr2dZJ+XplSLThMflU+ZvJvHXGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726060876; c=relaxed/simple;
	bh=AT0mXvulE4pw6G2TUHQqzZMIcvWuKvCb9Oui6aPfoFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DKwyITj92CoUcmjnF3YIMyz/5mG8Qj+C3YPUd5j3lWbClbZABoST/MsYpiVQ0V9toKzHcorCrVRrVGSspL5wbgniZ56B1sTsT6oeTw2l9IvN6VXpIm9g4kQ96uoU52Lc0AqVo/e0pFHgx9AJGJ/PotHNFVnDGr4hAjGxH0EnFKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Pg9Btt8z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ySHbpms6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BCgK91029050;
	Wed, 11 Sep 2024 13:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=N6dH5mW5OJqQotQ
	hfrGyhRoU7yCTv3AmT8rzBBtNd04=; b=Pg9Btt8zUCuTl7xhV6b9PJVp0c0+gTR
	a8M7pAKOoFp0E8U3Yu2AneyTcoOSjMkf31iZ2WjZvTJt+mhZm6QecHGZDnYXQjYw
	1mDhQWygkxGB7ESCXTcJlfvc+qghZ7O5l8qjbefK/0MHYodRpAixlUPYNqUX1U1G
	XlDp8fWFrTFjcwHrwKcNBXOHGcJEK7svo6ffwPaid4NBf2YO0q0JSYwiucqYJ0k3
	LkdHRqxMpp9oLn29/KBwpDtgaLIGZm2cOC5FdyrP4XQ8y+REXweoqe3VJ39H94DU
	8vj+1b3Utp+9EGrF4PO3zMzBaxUhYTYDC/bfdV/Ptt97QC2EFO/gunw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdrb86s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 13:21:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48BD5rH6019848;
	Wed, 11 Sep 2024 13:20:59 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9gerqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 13:20:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuQwA7YSDoSv/z8Qy+mJbeVTEsWJ+OSnb5FBs32GyIqSvGe6OAYHz/7B1D66uQy8cq0z7j+5PNbXY6NhL/tTf1luw/LxwEYFYDX7xUjztnZ5zoVixy57466pApdCWQg322laOgP7BHqpPcELj2IZPhfO7qS6EnGbOCMppOe9u+bozwJW+x7q9bqi6kNB/2dvSy3db0T5ZQDUaMFk5w3DWkKYMscxpsCuey4FvPHKS4U4zWbwylUzjl283kY5UwIktwP1h3Cu3ISJ7vr/CQ6jUADBf9c45lnIiSfp1bvNDsiz6ZoKxY3/nnJMcNsuXYRbSIIxEVnlpdnygMPhVF6KIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6dH5mW5OJqQotQhfrGyhRoU7yCTv3AmT8rzBBtNd04=;
 b=yK8Tn3sfN0nwDoKvqhIxP3UH3FMHwk093DmJONbFJVlU37n3b5sb3n+Z+yYCdjU/EW+I1xdM7UvSMZ3xFmr5f6AM9JUZrAImojPdKgDOnhVIW/wzsyqK5KQsQsuJBrpJQuKrH69Yt4HlGv3EMq8SAGk6BLHC0r4TtutKsfjDV0kUZ6LpTubFoBk7Z1R8IzcnO1aG9SABoqcn5CqtFFfVmyXZ0dM+qnnWXuSKMOn7akn/v0T/W/QCvgvvK5kbJYEl/EZBm1uk4UkbbXNpOzzzbi2uJyhBFDrvYh/RuFbl7JzgmvU6Qr3BPbF4COqij9+/j6/pj1ISc6oXWZO8xLdAhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6dH5mW5OJqQotQhfrGyhRoU7yCTv3AmT8rzBBtNd04=;
 b=ySHbpms6bZJjvBsgjA95PpCcqh6kMP/tZMaK5FieLdPudTuZlC7hdq7m/+thoVsmD+U8rVuwX8q1TFDGXYzvWuYOt2lKRPVLXlFR02TLs+fFCwJKjfyId86nFrXaLIqo1VJECs/0MUSPWY3ZYang8Qey1NukEWwqB9JN9t01Yc0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW6PR10MB7685.namprd10.prod.outlook.com (2603:10b6:303:248::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Wed, 11 Sep
 2024 13:20:55 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Wed, 11 Sep 2024
 13:20:55 +0000
Date: Wed, 11 Sep 2024 09:20:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Kris Van Hees <kris.van.hees@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <ZuGZNLHkUm+MOYpk@oracle.com>
References: <20240911101810.1d5dde08@canb.auug.org.au>
 <CAK7LNASLc=ik9QdX4K_XuN=cg+1VcUBk-y5EnQEtOG+qOWaY=Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASLc=ik9QdX4K_XuN=cg+1VcUBk-y5EnQEtOG+qOWaY=Q@mail.gmail.com>
X-ClientProxiedBy: BL1PR13CA0327.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::32) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW6PR10MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bb9e21-c48d-4ff0-2a85-08dcd264910d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r6LRrQ7HGCwz2yyD0v0TsfbFl6xaBGIa8GjfRjG12PyJoeTH3hhcdDHjbAgh?=
 =?us-ascii?Q?72tI9om3KwVIsp2llz1sgl0TIG44CUxAQgirAebw9o/K4ythS2C5xaoVU6UQ?=
 =?us-ascii?Q?d8+pUL1ac0+4cpNuKlfJkVjxYUz5hiNrgsBQQKrsZKYfNtKAyF05uD6h3KY0?=
 =?us-ascii?Q?fhx59DQHXHo+eDvxnq0HdeD2caTUWt0on+LLf0nA6Silqo73DfRn5fSuOALe?=
 =?us-ascii?Q?yUN5ndLmZfG8UItmZumfTiUkVffV1n1f60NvZc7DbHH88L9Y8byJc65ykoox?=
 =?us-ascii?Q?QMNViR77oGMuxiAaJYT3YCBB3xGx08pXL5W+lv5c1PzmHlmErJ2iqYXGPJpR?=
 =?us-ascii?Q?xwBZ7S5E/EtylmO4eYpaLGc7P9BgozlbZsXlgaTPjZNd9Qf9pOek2LKBUONe?=
 =?us-ascii?Q?y1SHf6BAobjZRr2z8vFlbl/ETZppCDz1o0kHEvpUMOoF7ddRrQ+tprCrjrWk?=
 =?us-ascii?Q?ySIA9g/b40ppUTeGoo7bMTaiFmhrM60s+IAdtGz7l4whrd80XhGC/O5qJckn?=
 =?us-ascii?Q?xYAlRiIzTuyhzFpR22lma1mA83pvRbqDMbDGFFumRvvYpQQJkv14lPqhMRxD?=
 =?us-ascii?Q?x0EdbIFIgAqBIrGtBdN3d3CIGdN+TWfkF1zzqYdfdQKiHm5zt4OOzFG5phzr?=
 =?us-ascii?Q?AeZ/02NW3x+bcNRqTWiKf3bgFlZt4LzCefTUkdhxRFykBI9kFSi5aoN1O4Mn?=
 =?us-ascii?Q?n2gL8gXvoedkiwXuaKtAfB0e9HkRBoRtwHOmS1zcjLEIYtUa3cuBADm7N8qs?=
 =?us-ascii?Q?6o+c7+DJGmrihSNoXLYe0r1mwoldGrw5/jNOH1GmSilWw1aUojCGqNg6VbEv?=
 =?us-ascii?Q?cCeSrUjCaCB6shP1s9dwJVQTXeXxlLH/frvKnPjkI3Xi3gInUQxuQjl8IFAM?=
 =?us-ascii?Q?3FUrrP7l8nWYwYvRcr2aLsVdqvuEEWk/uZe34C+eh+36DhUHhNOYKZz2xIx4?=
 =?us-ascii?Q?mZtS5a3u8Yya0YE5WaBJdFlC+pnUtuz7jfmfJobdmj+rmjtcAFrjzLC/UHPu?=
 =?us-ascii?Q?FJ2XvRvB2QNBW11h9SI0y7MTcOm8aSQjVwuaVx+QRX9ZsZvErLroQO2N2ate?=
 =?us-ascii?Q?shY7CsrdD3e35tG0JdZZykKkcj3V0jcBkmMXRVnhOoayo5Ks7v0Pb7HD+e7H?=
 =?us-ascii?Q?TAlmZdO/z0LHE6VPuGJe3r5u3bHD8GjTAlvk+jta2DyQujy89bAEUEeWIhhu?=
 =?us-ascii?Q?Jylvmu3/Rbubvp9tAVZmNN2XHvAmkYpCRjxJNfuW3PinfLjjoFaWFgldTITV?=
 =?us-ascii?Q?SzAmx4uKcg/1GmCkkDGjtZMKofAi8uMUDc3tvb0KEP/GUNgTKepPVFbWHGg9?=
 =?us-ascii?Q?e7hAjIkuwTYljp58yuogisEb/EBBJhd0QCsei9rfIGqxAA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EH1tQoz35w584RrAzkSVH4FTCkmvMsmcmKIsq+B3T5EYWYSRgsk1qyBOx2bx?=
 =?us-ascii?Q?aFGtFKrFW9lqNTG4SLbks01QmSPcq/hWqyCHFC2dzaarEYFsH0xkBuUrECLR?=
 =?us-ascii?Q?S9mxOJJ1Da6oeXsdEn5Hu8r+75DO9vwlUn5cb93Ngj9PDnPUr1SKoxXYWODS?=
 =?us-ascii?Q?DtS+fmGpW8B65cWs53p/mLr5brdnjNVHHKaalcwtvvL05kX/vXQFggNtmPbj?=
 =?us-ascii?Q?qyYczfTfrtFN8N+9tTEYvhNiO3Jv0/CjE1iRxwFqub7mQiPC+XHAhUYw0SoY?=
 =?us-ascii?Q?G+hRulvRa8JR3tff6hHw5SIxQgRTy/2b2xUmcy0H5KGkeIv5eem3HjMBD6QW?=
 =?us-ascii?Q?1iXhI3VnRS4DESpQOhxnEsMuF9yGwpij5D9uufd6caPgiD2FcXIvPHCEXiJ7?=
 =?us-ascii?Q?W5fqc1GNTMY5FtSqoicReFGFzsFhb9r2lEtXZZbTZt1Or0qrDJI0zENJJRV6?=
 =?us-ascii?Q?EoSjam0c3ew0SmZftYbcPhmaniKl4+KJrbvJvt2QCjGHSdHpyflb30GvVeNe?=
 =?us-ascii?Q?0nXWuc20+aWDCp9K9v59DcfotwJanGnk6YwuDrv3ZLcvbZ8bEkZIQMGjccwW?=
 =?us-ascii?Q?fmMTo1s1Vp3seehVXYvhS1zpa9zj/JQ6X3VuokH1xry/ZhzgTvQt6MHP0Wg8?=
 =?us-ascii?Q?79rnNuKPx4T2BA79EpGeyeaNPOkzmbX12SJetiImPgld3SDBNbYzV5UAzvcc?=
 =?us-ascii?Q?GbbSClcBlMVfsEDKSAjhk/DNgjLQtIaNS1yJ1NOk47Fe2hOD4HXwzhgDt2XQ?=
 =?us-ascii?Q?wFn+jGobtJAbJ78LgzXoUT5L4p+5a3Mjndk29dVy6xO6FYKIM/c5medU/9D5?=
 =?us-ascii?Q?TcD9ngvFnljnPwKqFNfdJBThm3U0GjzHqXiFPRbj2mRTdz3x7VnqkI0nZ4nN?=
 =?us-ascii?Q?0u0mtSvj7ah7qFnut/1SWYyX5hhVpQWAqjr7C2I4zz7Y9tOWiLGmG7wZ0tYX?=
 =?us-ascii?Q?AV+dCmMPesNFlh7ynoOw2YVXEKvIyhxZ3W0sCzjEclIdxQFAD/eK57vWDCMT?=
 =?us-ascii?Q?QeMs3+p6obpxYpHlCuFow7Yfzj6xBe/L1xzBfxanM9YxX9WEvSPS4BadRxYJ?=
 =?us-ascii?Q?zszIVRnkaY1FPLlhdCwb+fYBi373t8lc6tKfctbZjpd4TDJdYwIdJVF83Y6v?=
 =?us-ascii?Q?BJZ8MrGIWMW+WeVfzbHYY1we5Zwl1otREyALyuI7byAbclqDCLOheS0bIiIf?=
 =?us-ascii?Q?OWVmarl0E8BrzCoX7p7KAs5jW0l3cDbUc3NwL0vBEJS3EHJ89SRpCeKv4o4t?=
 =?us-ascii?Q?XbtAMCUQrQp74VjEtNLuaaRB3J5iffMIhZgPxs+ZD/rdQKcvqRPYiCF27OxC?=
 =?us-ascii?Q?B2hjKGMzgqzWP5LHBg89zvJdbifJbBnwA226sdr6fnISizjDPL+2bTHotjZd?=
 =?us-ascii?Q?/PHePYda/i3ViqQJCkKGOjMuGWR20mTe42WNY2/+kf2187H4RZjwuZChKz0E?=
 =?us-ascii?Q?p/L7LX2ATxrucxNZacSUguQDMaMpte4M90+ElqYeSARheSoHYRF+Pm4iUQnn?=
 =?us-ascii?Q?JzvEApgvLQve8fIjnBJErgnSpRIj+noWq1Z8ShFsQN7tRo5Ok1h9VaOqzEgF?=
 =?us-ascii?Q?Xezw+bcnP5bcb5AQKkzMKyW4hc9647vNHdTgb6pzfkTNJcasVkBf5Qc6nZoq?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	av0Hem2JJFejQyXCtT7DlzyLc6YSco3g4EotWQlxYurSIJsL6sVQa0zr0SdqzJfe7cOa4ALgeAwcFcXhabDBZAo7of22gOxc4X9j5geF9quJ5YwOmkDJ+xbSjblf3gERh9iDK5t+RACkjn1ETtPjgO8Zvu/GPDezc/vscnDc9sz2Ax90P3NSrX+ULri/xiqfSUPDgPddKWslBu9t3B86Xtd6dmKdYDaR6Eh0ZjTQqE0m3Gf2FlBw3YHX5qOWmfTU7oFLyaCwLUM8hAvMkNuxzR+1NPNByEx2/dAUAql9skYiRYHkN+eKz2R8+8ACcpp8zGqGo1SBqSd2dXLoahjQKNSItqjdmypCmNgeaeDkVLaE1sO3081g8/6Tk3YWFqNCpNh/ErHA2dLyJC66vCGGiQD4LmiDCVLlyYazUGON7gyF1iC6J+BFobVqKmWoAiFwmibOA1nMgEQ473XwgFMCFS+mWJvso5ihjDmz3I3Sh8jEnv+nGaCrrH+t5zrEMuOO8ipshYVNMYQW0wbtn06YiHEiPqZNfAK8VwOF45H7F+QRlgAogs6wPsYExYI4ItbINF8sDm8k3rvNnSGhByoX6tUV6oUtP+iYQto8SsMH3Ow=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bb9e21-c48d-4ff0-2a85-08dcd264910d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 13:20:55.3157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1PGlWYisA1cIdD9WfebY9RqrNsLB4pHQ3KnKv8pw1Z02rIaF9oj/kIgIz0o+S2SSEzv/wCd1D56kWEf7sHtG4BNVLtLF7GFs8wsx8CQipU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7685
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409110100
X-Proofpoint-ORIG-GUID: HNvLgF1SjOa-yI1g9ElRmOn-UQLbon68
X-Proofpoint-GUID: HNvLgF1SjOa-yI1g9ElRmOn-UQLbon68

On Wed, Sep 11, 2024 at 06:38:19PM +0900, Masahiro Yamada wrote:
> On Wed, Sep 11, 2024 at 9:18???AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the kbuild tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > make[3]: *** Deleting file 'modules.builtin.ranges'
> > /bin/sh: 1: scripts/generate_builtin_ranges.awk: not found
> > make[3]: *** [scripts/Makefile.vmlinux:47: modules.builtin.ranges] Error 127
> > make[2]: *** [Makefile:1157: vmlinux] Error 2
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [Makefile:224: __sub-make] Error 2
> > make: *** [Makefile:224: __sub-make] Error 2
> > Command exited with non-zero status 2
> >
> > Caused by commit
> >
> >   04b15cdd611a ("kbuild: generate offset range data for builtin modules")
> >
> > I do not have gawk installed - I do have mawk installed (as awk).  Does
> > this script actually need gawk, or will just plain awk suffice?

The scripts does need gawk because other flavours like mawk do not have the
features that the scripts depend on.

> >
> > I have installed gawk.
> >
> 
> 
> This is what I was worried about.
> 
> As Documentation/process/changes.rst was modified in that commit,
> it specifically requires GNU AWK.
> 
> Anyway, you were able to fix the build error
> by installing /usr/bin/gawk.
> 
> If a distro installs gawk somewhere else,
> (/usr/local/bin/gawk, for example), it is a problem.
> The shebang "#!/usr/bin/gawk -f" will not work.
> "#!/usr/bin/env gawk -f" will not work either.
> 
> More people may start complaining about it.

For the generator script, passing it as a script explicitly to gawk would
work because then the regular PATH search will apply, i.e.

	gawk -f scripts/generate_builtin_ranges.awk <args>

The scripts/verify_builtin_ranges.awk script can be invoked the same way,
or simply as an executable script if gawk is installed in the standard place.


Other utilities that are executed during the kernel build seem to depend
on being found using the PATH, so perhaps changing the recipe in the makefile
to use gawk -f <script> <args> would be an acceptable solution?

	Kris

