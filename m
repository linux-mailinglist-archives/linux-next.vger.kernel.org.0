Return-Path: <linux-next+bounces-5929-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CAAA6BA06
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 12:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05FE53A59F8
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 11:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FC91F09A8;
	Fri, 21 Mar 2025 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QprifWyO"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D391E47C2;
	Fri, 21 Mar 2025 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742557179; cv=fail; b=uaFgkZUIp+ha4LD3yUEVnhtRpLF8j1Tvo30Le7Za+xxZKsMifddyi5wUL7sEex1XVNfEGqoVKkeuvwt0dLnFjtSJk6EOcNbatStDFuNbaWK+Jdlr5O67eyuYzgpA2AcUTtmKZw9nxghrQHEbvHhlFsPu6mVz/VGtkekBVzj19qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742557179; c=relaxed/simple;
	bh=oSkPMZ7C1HxZP/ey64dv9uXZPxJTeXP01yIFw/0HfmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=squb5RMDm+CyNC0+b1bH5KhqyWP/snHaNUCOh49krcFSCgtmcZ6sd/CbQfjWl1tn8+KKqsYQN+BzA94fTy0JCoYYzFsjduXE6dTsNGFyD36Lpr2s45OAIlv+//46qV5m8ogvyEcMSrwyAGGUmpjxX2hCqTsPZu5z7VUKKi+E32E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QprifWyO; arc=fail smtp.client-ip=40.107.93.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9l988zoq8utq7seA6lTIi9RS/KWPrWp7Amr4M45X3joB8c6tmXuTlTfCMXsOBSM4QTfEosNlgvf3v0NKbjE7yoqcQubRKGa7LLukCMzHl1ufuFaEGjwuEP0AIT3uyPuYOh5FnEN/T1uSdOWDdT3eKIS3cJniM1wur+rFre1E8pbILJVg4/POya/hI6SARjkzCnxZMAXECnUrtSc48peOlsduA/+PreVYtkNK3mkK4OEWRFIGZktHtjSB3ke5ybT5BFNU8qHwIJPrFx73yxn+Q1A0idceCaoWEB5R1vdwt5wrb829F6IAcMDEPC6VN/t9HK/CE5W41TNnZwqJOsgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZN/cB6Bxjs/Ng6iTmJFWR4WU4oxtcdejdnGTKIT330=;
 b=Lf17jDfZfxtRSIwH0ZxrjwvFSzZFitQyS9ibY7WtohbZE+yxFObW5lsD2l86umM81kySr/YjSFizDUpyJzTISxmjm6rL+0rDIylAhtmyMjqtUPo2gQ0rfkNmYTZT13vWu9ee/pLmVEsowSWM1MNRN+vFr39KDYr649iL6MozqBKiwluZPX2eenkRhKxqpgNnh+SM+tBxper/hj9lK4H16RXkPxjfajoAo4xpEccu4IPYHSKfKcprV3EMMk169IMlfkG3s6Ia2p9m/d4g+D+Gad3UWY4zxIu2MZcOfSZALStiVnyRwh6hEIC3AM6UAeW7+4bY54qGQmEW+p6B3Aie7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZN/cB6Bxjs/Ng6iTmJFWR4WU4oxtcdejdnGTKIT330=;
 b=QprifWyONeMAFPxpdJsJMu9IIpqesvdEMmQYt+GefL/vMnvVKb88VasjUkIdTehCMDG1dyA81oiDNL9b/IlbwGHyUoki78Q0Wcxiv3vmTKHNdMQILkdkeKxToSVdJAfV3PKFPEgwgnUJiqy6hBQEMBArFnmlZpEeAF+P7uo1ULz+TkRNbGKW+R0Y7Kio/lxV43gQs2o/AfIN3B76QBxuY8vKsfH1Un5DGjZiBnqm+ahXji1L6b3/rzvysmOWrs4+KUiy09FAYAGcV/esmF7yKSgw0ih+jp9lodvugHRn4SUHNgW1UZWQuD728fmIQYk1EI9D196L5hOlJ/RY22s/EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.37; Fri, 21 Mar
 2025 11:39:33 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 11:39:33 +0000
Date: Fri, 21 Mar 2025 08:39:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iommufd tree
Message-ID: <20250321113932.GU206770@nvidia.com>
References: <20250321193600.2bfe03bb@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321193600.2bfe03bb@canb.auug.org.au>
X-ClientProxiedBy: BL1P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d0bf68-06ce-4c26-99dd-08dd686d0ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZDRUSN0zkrmKjgE5KjPQ+KySehiIB1OOsIN3pWz1fRp/PtVgwdlwGq2j1udz?=
 =?us-ascii?Q?YPKFpRXVi1R3ScRtBzd9z/R43dftSO6kGxKHWkNUfvhBF2drmg8SqzdoyyBH?=
 =?us-ascii?Q?wUgLczvsCJRcA+M1WEzOObdMg7wBDCwuLmkR1+OgdGgYYnID7TwkYUBxQqD5?=
 =?us-ascii?Q?OUg7PTbizIVbe/hja0lkF5GqhXAzE0urGkj078LoSleA5ddglcpM/driVhg8?=
 =?us-ascii?Q?71j/ht7ELSYSgDJoRujbnlm6/pLNhL1vPvfjqD+OwuFC6cCBM4/ylhBHZ++x?=
 =?us-ascii?Q?8vqWI3ctcTG9GXLssYxsqFXNIrrOl005VLDdNPZp4rG5IUwI9XbP1GQ8y6d1?=
 =?us-ascii?Q?v/1dehbIM0d/7o26dUWr2r0nbv+ow2M5FCsLLkyHPLscP0K+4+enSA+zCVGQ?=
 =?us-ascii?Q?KwbUUZpAHk5KKefhmSZCEX8DSwtX3WcaTWBbK+ESbJExSacBtI66mdVgkr7T?=
 =?us-ascii?Q?AnTBvZy7XfDXyGLYdkvxVHJkN6GT650eSfRFFaQllAzF0ueuqmGcG4HTkmLw?=
 =?us-ascii?Q?giko/1cqZM9CEnwOvSx8hKLmcnFIwf0HE9urJaSZzNbyFa3HpPfUZy34tQ50?=
 =?us-ascii?Q?bhPNzjx4wlOOK3JWF9YmBEILddGOIsNIjL7dhlUPfBtQZ3uV/hIIdKnB/YE5?=
 =?us-ascii?Q?krM0zjccbogbanmfW1S1Kxg4LDh4YSFFF4lYhNgT7SxIiytNshOFk013+9Ac?=
 =?us-ascii?Q?J/l2gBp/KdHYQ6NcLkMDR1ooIyNKRQfh5rOXE7FRFU5PhsSU3Wz6aw3I8P1m?=
 =?us-ascii?Q?ZEk9s7oEwh4m+FgooEKtZTpxA10u0FbYqGIIXlexeSbfqVZjN4wUUsKk3qtX?=
 =?us-ascii?Q?gN/p4SD6c3qaeTWcJOQExrunNbA+YN+4Yn42fpzWLUse8RtkU6LAVLFt0eXP?=
 =?us-ascii?Q?dTpmNplU6Axd0SjkQVn2zOteHDUULwLx0Bvvn2gx6n/G7CWUi6Xa4Chg1fLB?=
 =?us-ascii?Q?FcoVoHSUeK/HQBZ7Ko6Fxcrzcz9QapBi/orvofMy7q8fgugyLav4O7Dwd2d7?=
 =?us-ascii?Q?1jjyiGgOSbMagjQS7pBtV8noKcd5luTQQo/mrdQ+qJc0qTwddzPlJ+3vHpYu?=
 =?us-ascii?Q?FQUZsmYlj0839NYIZ3DCA+9lSS21f+e9TZ7DaAjARr1XKzBr3ORl5EoDeeto?=
 =?us-ascii?Q?5DG3+M/rX3zJZIMe7/UVmNXcUKY3ciIx9fpuPe90Nhs/Ur6iwD4X0yQtKpTw?=
 =?us-ascii?Q?xEL4/rJgGU9PtNPBjs1zxlR5urdPzB8CIh1tyf8yIEhw/w90vxmbBky/mRg+?=
 =?us-ascii?Q?v2VVDhui7p5M0KzF6uevabws3am126VVmKK8ZuijVa1wYqRBQWfilqfncvAC?=
 =?us-ascii?Q?bsdhGL5bZmikAw/xsXUf0C5t72L9cAutDrMa5j3EZdX5zIMQmn20J5Cne4oE?=
 =?us-ascii?Q?YrzI8s/yy2fNk6BGsFLZQ10SBbSN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jhULhlwOBB3WSxbDWaqOb3WzFsrnC157625JfLFAbb8TN3QL7btA3iCRihYF?=
 =?us-ascii?Q?3YMQYoRsqLEBzqEWf6gLWy7gzL0reWXNAskypfZOwQGLXs778NWohgfsXN0c?=
 =?us-ascii?Q?Gv1afyOmGGMOgfoyW2cb/pda/hpcEpmLVyC1XVFzm8vkkSX7C9872quw1yWy?=
 =?us-ascii?Q?cZe6hQWckCc7ofplXsxIb8DAEp47kD60I4gv/JgbQmLW3IWpJxY+ekpTl//T?=
 =?us-ascii?Q?PwFNSNNHMl9UJJU05+sswTPJX7qtmrrLLXAiw8u4AWarTclCC0AC/7zVu1Xe?=
 =?us-ascii?Q?ug1xuYqAgeLSFT3BN1je1UL/Gb3BkZqqfa3fMryu9v/JkuwCQ3GCzZh8ECpt?=
 =?us-ascii?Q?x63E3vLzWZAvvx/WAZZLM0BWDlVxn7wm2sT45z9Z55TZuXdXALB+By1/gK6h?=
 =?us-ascii?Q?wgibgrPLipr1KqxZy9JUt5RayG/DYhbai2t7j6KcXaDaWZJZPyllfvlNNFOz?=
 =?us-ascii?Q?yZ7pPFPdUrQIXyBpQy8BcMt3eZoEN32+OoNGrNtKpPsSxLr1RHKOEUzO+P7L?=
 =?us-ascii?Q?kOHNGrt82IuMd2g4ZApCXpRo5QuCp/E79qLW3v5F/l9I9Xs7YTFskqdIrqDx?=
 =?us-ascii?Q?7+5eYaHAz2Ka7jkq8bmomgc5itKP9mLPK1s93P1PrlQaWQlR+GFzYhXcxCEG?=
 =?us-ascii?Q?L2wRupA7+3DgpPmmQkJytU/XOU0tBWuJomyH1ofE2KA6+T6rN5AgYXhpPvoL?=
 =?us-ascii?Q?4Fwm33y4MicYVEJ7f7eQetvc+ZluXCFOCjNfMMvsJU7sIoXyIaoeECDOljgP?=
 =?us-ascii?Q?OVCsV1V/ab8XJJhC6PjrnfHIe7OWIayergE+95ie7M8/9wl9PNxQNUC7FHfY?=
 =?us-ascii?Q?T/Ul9fEFr1oGdoQP7kWbeHHrluXnzpLgb4bT+viyiZ5LpJF2srTjjP1dNuE7?=
 =?us-ascii?Q?3nVqHWAOTLAIomCiA7thb/3G976yGNY/LUCloBL7POXnPzdcxmNl9pB2m9bj?=
 =?us-ascii?Q?qUq3zz17wHmydddOnH8N7qc1VVVV/v6MM4WnRSAjIiZhsJf00LEHtd3Tsq6r?=
 =?us-ascii?Q?PfMn1uSDXLMn3Rut/fa28RP8j3PhBEZ2r0Av8ffUp+1P50JbN95NFnpi5Kpm?=
 =?us-ascii?Q?4EqJccE8wDD5NRP+E9AEHuXQuMmg5N7vbUn66sFE2f2rG1aOAmGdiaOhxK+x?=
 =?us-ascii?Q?YXcQcl4t/0qvjpMYJ2tnaUieYQVZ9o88Hh2nr/TJWDMVRfS+rpH0C3kJiI/a?=
 =?us-ascii?Q?T/kYLAAQoMSUL6hl7hnD+hK6mkLZOx4fK9cH0YW9j9ENLr7tzEgd85+Wxq1k?=
 =?us-ascii?Q?gWjCNWQk9dsMLYolMFSGh++6VE8HpZCzCZD2grMXm3O0Yktg7hFqBmIHs3x9?=
 =?us-ascii?Q?ruxgLEak8ab/2DtVpHCSeL8nt7KN6HV0RL2oIG/4RNCYn5P/Cw17Nky8lGfj?=
 =?us-ascii?Q?v97tp7EgOWBZqVO2DQdGlfRoCwOesKgfxb6m/XpS55Cz4cyTO+UweIZivq9t?=
 =?us-ascii?Q?XbFxrjrOg5RPPl5oaUR90eEajelwj4JlFk1pSKtmgxw+fQxnFO85hRkLhNQK?=
 =?us-ascii?Q?8TdhUPFq1L1vKzw0CVlcsaNzU4NTCw8CmPzY2po+oOUIVKLGigdzfCVT4aZ+?=
 =?us-ascii?Q?+jZ4aTbdkDqV+1GYU0DKbBfxlCCMgfelPuuNgfuO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d0bf68-06ce-4c26-99dd-08dd686d0ca7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 11:39:33.0962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tf/Yd0RJqeAHvkrnLJUs3xW8ivW88GPXVqYHgI1TBloumNQg93BmT6I5NP/wCRln
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787

On Fri, Mar 21, 2025 at 07:36:00PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the iommufd tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> vmlinux.o: warning: objtool: iommu_dma_get_msi_page() falls through to next function __iommu_dma_unmap()
> 
> I have no idea where that came from.

Me too, I've been ignoring weird objtool things because I don't know
what to do with them :\

Jason

