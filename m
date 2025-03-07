Return-Path: <linux-next+bounces-5701-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE53A575FB
	for <lists+linux-next@lfdr.de>; Sat,  8 Mar 2025 00:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22F0F3ADCEB
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 23:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC66258CD1;
	Fri,  7 Mar 2025 23:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PBHEvrsi"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56521A8F97;
	Fri,  7 Mar 2025 23:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741389925; cv=fail; b=PEPwnPmVObuawO4+YuFs9iAkYIz95RArfNNDXlowQKFAvp+GR/gk8VSb8zDOUxrzu77mIIG06r4vL/L6XA5xyWLeUNa7bwwGTbktiHQeVCfp7APjaKR2IcYcCbvdiKOIEeS7H+NPYzR56WN/5zun7rKIJEOooyRG+B49Gi0zMNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741389925; c=relaxed/simple;
	bh=bthLCxRRYHGxAHbOBpyh/mNpASNZP3h6keQP2RurVgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f0rSPr0S/4pUmGMW1XRfoRo1o4w59JzE7v2AGwNVytGtmNTpWgfRmNgpZMBO7hSO/7qZIIA66/35hrhYhtF6XpxjNXp87dLwlBNJXrDQ8EGAKasnaHzaS9daDNVdAsqnEAK1kw2DHT3Mr44ru68J0H/v3JCzFFleXCRTnFw9FKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PBHEvrsi; arc=fail smtp.client-ip=40.107.92.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeuNXZSqnRxv8S2IpA4X3AJ9Y11OAxaOiy6yIB6vuarrFl8x6I5VFvqngcMePGoXZ5rpZqz8FEKfRzghj/ZyFm462L1zgvL7gRrlDmHAS91KrcbrcUtyb+q7hKTops0MXV1MlbaCmQqB8BQzz80b/HWEizRDI5PjdUSIt3dGzY4iEssa7oCbqt6NRQ2DcCuvPAb3/mGuZjJLeiNXz6A2KWALgkJK5MNICo6VcaXEGGQtANV/P7tvCm2wuYp2Semp0sJZkbVKQ37iDCl1StkX8akr3+b7yJ+/4gkkzunG5KQKCOvikPo16rBg8EDyoVHYHNYTookNQQ/9ZWipkeDQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p4BO56RJtcW11gksCTIC/Epq0UyoO+ih7BSkSSmyF0=;
 b=oEBUPIowyshhGqTH9vb2HluGy6QzG9GZOG9VaUGZshOCqkBwo7FWUPwBJzx4umDBhimpxuqRElZtjIhi/rZoxlqq7sWR6YqK5HMi/NpnyCIo3qcYmTg7Yy2mX35oEsEhbfNjrW/jVajhWjawR2qJhdpmwn/jhtjj/ECh4+Hl9XZvQM09QLK2t27IqJtS72DLtxTqEWk99R8DQXpkTKpPmBfAcjptmRQxhDvTPGOZwm7iKxY6J3RbLWQv6YGzwBZzQGnX69Jt6PWqgHoUBU04XZW/EnRCt9mmBehCrorfxVA3HSL3F1+VHT+vk0TAbXbUK5vsGJvgT9siakyqauX3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p4BO56RJtcW11gksCTIC/Epq0UyoO+ih7BSkSSmyF0=;
 b=PBHEvrsia+Lhm8/TbbWrPOmiE63LzYuIxqRuUHqudtROS4A/+6/9eKjWW0z7sttyRfUhEkEeh2dQSof8SWUqB2zWkfLdcg9QMG0tyEydMOPfW/Y9MizkIDHqzLLZwDY9tRJ5ULUW2vOFtyt2lVmi3BwcDzIhwoIBdQNEvUosXTuW2UCF7NFulffjRKNUFH97+0oRRNgaqV1vmBO/lCotKzxboBi0Sd/wpG7WNtbjq6tBk8p4raX+jbZXRYp45/OxFx1Y/AKNtzT7XyyPChw2OBH5xSKVhJP1MJXTQs87w2jTA6k2EbD5UdSfckh/yjF4gerZlV3VRz60nT9TiL3LCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH8PR12MB7352.namprd12.prod.outlook.com (2603:10b6:510:214::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Fri, 7 Mar
 2025 23:25:20 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 23:25:20 +0000
Date: Fri, 7 Mar 2025 19:25:19 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hmm tree
Message-ID: <20250307232519.GA470898@nvidia.com>
References: <20250307195715.0b7abf0f@canb.auug.org.au>
 <20250307150434.GP354511@nvidia.com>
 <1ec76ee6-87ef-45d2-bd60-41e2e1372e39@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ec76ee6-87ef-45d2-bd60-41e2e1372e39@intel.com>
X-ClientProxiedBy: BN9PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:408:fb::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH8PR12MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d23d265-8bcc-4460-67af-08dd5dcf539f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EnXpIBmgRpDMg6/oTG4vGiU0AVH1ilr9TomzXBhPaqao/PyjoxOdD4XBNOc0?=
 =?us-ascii?Q?yKHnQjXcWdc+fmXaihKfY/9Iudd53TdHIf7U2EMIyQOPZbh4rzOPaxZaXt1+?=
 =?us-ascii?Q?/uenl1pJEFulgdvHK/TrdNRkpuvFt/pPyQFkzqqXrlhWYXGxnxgNhuqCFZy1?=
 =?us-ascii?Q?Ic6u/ayilp+cwRhvc1ytwKwxKA0h/oHGkmBFnOt0kbIyGB9/xX3r99XNaasJ?=
 =?us-ascii?Q?pgksuq9vj4hmh7gsm5FGHAqwKe+wdn35VXQb9/d01CDPzONBLfklPdPmjYff?=
 =?us-ascii?Q?aIpp9QmMcjvpwtPxfVQWIoJtqFtjwAVJnwS3C1CzA761rleDDDQ97jReSbF0?=
 =?us-ascii?Q?yBt5/dyfwkazObZwUs/SriHGKC4XyCii1ffPd0SlCdDPfhxmoDzcForyq8Ly?=
 =?us-ascii?Q?fIU+Uf2yo/RGD9H+t78rqw4HK6xrlL+XuDh1uPtOBUuohplEPyjk8FRfqGA1?=
 =?us-ascii?Q?52iI/WYbm0bmtbmURO/tWRMWeilLiV+ipEtB61x9cDGTpZkYCK1rHZx2q0+p?=
 =?us-ascii?Q?wZuHQDnIwTEgFRNmCucFz/HLVg8DtCd0UsirGsrP2u/gAmZLOR8TV0xyZLT2?=
 =?us-ascii?Q?tV5nFvX0P8OYTE/W73dSSWZT0i3NfVvwpCEyDcFJIaCdYkKuKlKKIthWEXne?=
 =?us-ascii?Q?mb0g7kFIZT2P6pEHM3yWbzd+etnNKz6dEYiBa8TWqaO0FQVVswfYmo/nGrGR?=
 =?us-ascii?Q?U8barkrNIWjm4Y+Ccb1aMbnI2NzwZAmtvpvcp9LY39cNRe/DASs3sjoFva/6?=
 =?us-ascii?Q?OTEXavVcrWoaSl5X8Dmi0zwS5r4OZCoFbgsj0cIfoaaTtEutb+foggHzb89t?=
 =?us-ascii?Q?iC4ysb1fGTVf7oGp2xZfaYlDQ0WKIhvGoOd5hC6hpEi8tGNEICfim66OogUF?=
 =?us-ascii?Q?BLccUOzqs+Kg+7kNLJQIPvQPZrjU6iKmDiOG8mh1Mx8CZ+4ZYDsuAa/cxwXT?=
 =?us-ascii?Q?EpIpMP1Ie4RFswAKuRBc1KBD3xZKZY+THCKqf7Fz4Y05iQH//2CWE6HsMVyo?=
 =?us-ascii?Q?Gtea2Qv98Uotn4auhD9YhPvr37YOdijxNA9q7kj8SCuyrG5NN2W3LnuVA+sV?=
 =?us-ascii?Q?lz21l36isznPuAeA7BuQA68y7KRszWn63sgaWR3joCgG9F9qJB3NjeoGX7oz?=
 =?us-ascii?Q?APscbMNzPjLP8+/8/bmqP6zJfvihKbODMfon0ziU3coEufoNm8t2S5Oof0PK?=
 =?us-ascii?Q?r6HFOeaC++2eNYVBoyklkff+CdfdBldbf8Dhd2sXuB4zaEb/+UiDGjr5rf2o?=
 =?us-ascii?Q?mHpytKBzjwxNmxhtugaZmexrF1tRc6fOT6dsm0Lacprk+qc+yMsGVyp0twdC?=
 =?us-ascii?Q?PakptknwI/qm4+nzqg3CQh541yyT8hWTNZbPpKn0AUiZ6gghdrG6iUZWJzr9?=
 =?us-ascii?Q?4wDPeYMcLARAkus8bxdX8AFOkXZX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?231cVOekzzjxA8GHLEnu3SfIUOqJJMGNpySFw7uwaR48HVzBOUN5YD2zYBKc?=
 =?us-ascii?Q?G98k+SRUUwlCXEj41VDd9XiLKg0AqlWoPVus+nwxaoh/TTHB37MoDSBWP9iv?=
 =?us-ascii?Q?upwFW457yNbOH5qt7qxFzo09GegYU5NmznfRfH6sibCgg7bG64w+GSzzUdnq?=
 =?us-ascii?Q?rJC68otT3k/Ct5k48c0jE83CkLxtP3bjsTZrIiqFy9dqhyeX+xi5Gs+zYpxn?=
 =?us-ascii?Q?/LV2bLIODubiEeIFX4cVN5gytbopPIKpSgSBRwj7mcBU/yYOMXp7ypIJQ1yX?=
 =?us-ascii?Q?RbRvioJMuKBK5c/RKofSFhcYSHOsC17ENPyeW8PpVuAumrpSKC2nNG9ND0iM?=
 =?us-ascii?Q?jcNlv/Ql4nImXhcV/JImUJiq/X8wTUetmuQFgbfh6Wd8gc3aCI6S/SqdCRfu?=
 =?us-ascii?Q?kt5jL/QCMxuLDhN7FsqRJ7o/Ak8UOIyArWfixjb5iG0Y3pMnwhXczHuKN5tx?=
 =?us-ascii?Q?x8KtOmwDIwO3wAt7mD329duaj9E4bGpx3/p2RlB0hbnQjf19pIj7+5jw52eS?=
 =?us-ascii?Q?hlb9QQDZGb/kq75bODzFz0/mvD9sAaMJjHDBPGIdTfWjSGkF9DcBN6LfY/Ib?=
 =?us-ascii?Q?yfE+Ea4/jM0JGKjpQNTFRadRCiVZXsy7drAOk00+EcUsorhpjTAexe0dX9gs?=
 =?us-ascii?Q?tP4MtVquyBGyWRTuZsv0EhUgQkYb6PBmxpdTqk4FdnFf7FmBRbNHQhLl39CK?=
 =?us-ascii?Q?I17xfyGMxAydH2Z+Hvzqeu/XcZwIVinP4ECnaG+xY8dJnAIfEIfh3RPKYqaG?=
 =?us-ascii?Q?UfVhU5kBsth82ajrEcTHiER8dxzMwsiUgRz1VS7eltRvN6KDt63j7zcfULOs?=
 =?us-ascii?Q?n6K6xWL/Ryct3h3NaweSBUxNdTKVk4/PWa7INtAHuDbdhLFG9nhawtjf7XzD?=
 =?us-ascii?Q?ztXX4K1atlcRnjz89PilGx+J8xsfPgYy7HSaUWegZxNKwrWyz5TXoOpZMriE?=
 =?us-ascii?Q?mAfyQ4f8D+WQFooPUwmyut1gueW4SNzVwmX0GTFhFFMRd/e1YbEZovWWRQJB?=
 =?us-ascii?Q?zvodFm4d92GgHbA1selfiDoDWLz7CHKUkt4c0ILWM4ZNwpl4F0YKn9pZ2Orq?=
 =?us-ascii?Q?E+x/jOtWjbdrvFBV7K+J8box4VhsfRvGIZHpDCTcQLjuZq74ZEKtwmyPQ2IX?=
 =?us-ascii?Q?o5cLZd7dKJIWHcwv+rh/Jl12nsAPPxyuOhv3ASDtaa3C+I+uEDTDG6mGSHyM?=
 =?us-ascii?Q?gmdXkq3Fd5b+XtsIPKOH3mRnNPTPogeQykut3NrMxP+CJd7WE24v5aUfJOcb?=
 =?us-ascii?Q?FVhHpeogf5rif30UORtrpiPXRRpPeoryXFEYS8COxmjS472qX2W+drN6IFk5?=
 =?us-ascii?Q?m7qK5VynFm1nsBfmYCSXxd0xXPh0fDHOMTTcHyOLw/gDFppaBNUkg+S2sjLI?=
 =?us-ascii?Q?dblr9KvWrAMRJfsCn33zNhdfiMKfK60rf328ckyYqCvi3+4lO8wyVteCxTBU?=
 =?us-ascii?Q?f9fIoGmUkTzEYh20MtlnugSUvEM1nN015Z2btsvJ2bCfymbbFNYUhBA32u5l?=
 =?us-ascii?Q?mHxB5tiAIgRHtLrLl2cElUaUgoDRPzZ5QdK87KTDCRa2OfLbpR3mpeGrB5yq?=
 =?us-ascii?Q?c+0YQe8INMELqaH4LFn9+k1WXMpw0shR4s2gQScS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d23d265-8bcc-4460-67af-08dd5dcf539f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 23:25:20.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKlBaiKzvz4uSgSBX6ZOwROmOup/GbP+tmFmmhxxsJDj3wtfDL3j/tzYMB8MhckX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7352


> After fixing up most of the issues, I cannot figure out what the issue is for this one:
> ./include/uapi/cxl/features.h:1: warning: no structured comments found

It is because of this:

Documentation/userspace-api/fwctl/fwctl-cxl.rst:.. kernel-doc:: include/uapi/cxl/features.h

Which includes the file and as the message says there are not kdoc
comments in the file.

I'll squish this into your v8:

--- a/Documentation/userspace-api/fwctl/fwctl-cxl.rst
+++ b/Documentation/userspace-api/fwctl/fwctl-cxl.rst
@@ -39,7 +39,6 @@ fwctl cxl User API
 ==================
 
 .. kernel-doc:: include/uapi/fwctl/cxl.h
-.. kernel-doc:: include/uapi/cxl/features.h
 
 1. Driver info query
 --------------------

Jason

