Return-Path: <linux-next+bounces-7490-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0CBB01DEE
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 15:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DEED3BEB22
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 13:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8E92DE71C;
	Fri, 11 Jul 2025 13:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rl+Z6ILd"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEA82DE705;
	Fri, 11 Jul 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241142; cv=fail; b=F1j710V7mZosRLZC14qDnVn2a302cBDYHAKKdJbUT1knLaoGuPvGXcwYzDQc9Q53Mh0Iz+ZppfiDptutMRnhmcYByP8g8t/GI9/UkZvgtZ0WoXlYOCeCL+jjjWpIqsmMtI0DAiPB4sO6LrQ6EO3pyouTZw7Pv508K0x+UPNPid4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241142; c=relaxed/simple;
	bh=DncYmtL7PqOm5i+oFpRUNqGRR2famhreeTUY5Ik31co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a3Tyo4kbp2ySnRQ8Nw9nO8W4RhW7ntGX4v27mVMaGK5qKHQPF6MFhpqjtfWkJzKnPtRfhET28x/0OblXSXWJSz1xRNvr9/6aMsdDrisjVrdeWw77vDLmxYxE/PnkAEPQpS/eFEnYEXGRTtfLLrGgxT0ZswvcfzXYcwy+IEEUVjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rl+Z6ILd; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrWToi6EiS4d0MXEgbGtjb/WMfEnB2cndrP28R+ObMlbYmtr24sSQJ/PeZawe8f74WjJr2OFdSuZlJ8MTrxNMP5tFFbHiN4BtZeMF9xbqOG7cjlFbkn2o15ZtuFRE243UOX7fur5ytVF4+cksj9+ubsCsbW9xl+c22WoHr0svDXnkjPfCGZxFhWKtoiPNYAPrdfqq89j1eSlmUG+Mv6f1dFH+0XZWUhyTIU/x57T35fA6mvWxYonHm7qNffz09isEN1g3YdnXCgmWKgnKBx41J/6y91F2Jbrtk9C3nvRE6aArjCB+3zritcGQ0NCYpnEhledpWjZpiNzHsmvjVmk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8pNgye/T3hWVM8oGUWdc9I0u260+ae2TeA/gL6PBC8=;
 b=tHoOv5Js9QsCgfzyzKb0nZmy+LcWKfT8XgPmN5d0QGADHCJmNHxml4rwFvhfrK+5ckQ0dDpoqqeg7aj363D5FQu+QdJHigQP7ATm2HeIt0cZJqJbf/Eq8M0knYHXNKkMP6QWZreUQuXWmhSCT++SWU9jazwx64z3xFghXWbHh78hLZNw1shLJ4tKpqZ6sxAq932nA1tS1Y4JNrWtto2gZZLXtP78FVILphjoMnuIRIHAFhq3FToiJNZa/kRjUs1s35dHYJ1pUXbiTXQluH/JsokQHSMrP/qFAcf5cWSwY8LH68TQrlaXnRc/S913Eg6zaJUqBK0M64PMwNatSjh8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8pNgye/T3hWVM8oGUWdc9I0u260+ae2TeA/gL6PBC8=;
 b=Rl+Z6ILdjXrzq/SWIJZ9l0oayqn2evXKhCT7GHJdch8ujLfIj7seC2H6g9FvrEnqtMECK09kx3aU8eL8TJBMJr+DD1ooozo4VGHqYrNCoezXr13PQwqCc2lAaGo24nE/0WyiFU52BmTCXH4qOScOlM2wLEhluEytHiNYIRQFeqRB9hTYG9WJJtKfNzhO6ZVTOVAnqlonS5dT/jdW2imteEDIu92o1yzf1aXfq2x1Vo8OOtZaz5Z+AMa2xlbdW8X4q1kaMrKK/JtCMXeCaDhSU5NeyQvzrLChHmAMK/9BCQSWLG0HtOCm6MQx70UOOJuPVLw5JOh1cf7o1nBd/cKM0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.24; Fri, 11 Jul
 2025 13:38:58 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 13:38:58 +0000
Date: Fri, 11 Jul 2025 10:38:57 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iommufd tree
Message-ID: <20250711133857.GA1951027@nvidia.com>
References: <20250711182501.29b6b9b8@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711182501.29b6b9b8@canb.auug.org.au>
X-ClientProxiedBy: BL1PR13CA0260.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::25) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BY5PR12MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf76a48-93fb-49ab-d18e-08ddc08049a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+dEDqzCSyxkJbHSGdwskgZ9/uf00eZAHIElCTOfYonWtNcjlDo84ep81t/9Y?=
 =?us-ascii?Q?sLp62M3YB+oYmqGyk/Q2mal2iJni8F/A1uwCB0Ngpl557iR3JSp9ehxmpD9o?=
 =?us-ascii?Q?miaLD9Okg4ri65Z4Mcdf0Bs47n9CMKKuXSLMsASg8h9tjU9/Kn7jqD7sdmdH?=
 =?us-ascii?Q?1wM0XFHkqx/kEr4a6y/FOQJSRXIpTA1II+Vgqe8srlrgdgX+JEKOK8dFRXWL?=
 =?us-ascii?Q?9XTDV+dn9rakwfUHp7hQpcXSRFoo9BRzJKSbE+ZyxBKIJS7NqMORtZ1nbe58?=
 =?us-ascii?Q?IPBRcsb7CwZedf2/saBidLVhzlfojuyNegRqUfuqcLMqPoJD3nNzzqW+N683?=
 =?us-ascii?Q?y8dYfX6vWPcM6e+9muMF4Ywgj5qekrBIIOFFChOfDAL3F0aqOA5U+XfTsGxW?=
 =?us-ascii?Q?FS9AcbtjllHZGFER+J4uXn356jCYTVgpNvtWwHux6WwZhN0LAHMGOJ259CBa?=
 =?us-ascii?Q?fvZXB0wa0iOsoJTo2iL+eSBnq/A+5HmupxnJBI2Kx7Ludn/RzmS9A+Q3UX7Q?=
 =?us-ascii?Q?ZyDRoZ/KTkbtas5DMRXMgay6OiLGVmuS3cEPMftxokyHDU0zYGOpOjSdCYZA?=
 =?us-ascii?Q?qMjw7CiGzZtPw/RjM13ehc2CLvnP7XBakcArI0kF6T8rFZ/SwBcdFlHa6puk?=
 =?us-ascii?Q?f5duy+1GunNbBbq6IPbfyNrIj+Pm8XjmOAcFvyPk+3QXgQzRINI57TEdxaPv?=
 =?us-ascii?Q?X2++WSh/8kjZoXmbEWAVuO40n7j83PsKfcOB0kPJH7iSF0mPthnKWEgugqMM?=
 =?us-ascii?Q?52swyS3P53V/EwG6zMQKg8umuQBCTrg/8YybY28qRBArJ3ASF2rS/OJ4o3FJ?=
 =?us-ascii?Q?lnVtQB6mWoSJr5q88Zvj9I9zDAz77d9kS0qR60IrsSOU/2v/XoF5tiC44FtA?=
 =?us-ascii?Q?hPqs/ip6ZOyq5CSNn1LOKnzkUsL1jtfHkjPhCpk2c/cCrpXQJFgplUGbtyJH?=
 =?us-ascii?Q?p4A3Gc+a87a046OZmNQuqjtW0kqriCA1DAQv/XtAWNPd7RCC5aICNvrSTpXu?=
 =?us-ascii?Q?C+6k8lQEgffRdbmKw1jPiikfYC2zjCeToTEejiDKLlmynTh1KxcQkukfxU5S?=
 =?us-ascii?Q?/ki1zXviXmASFxSt5KYna3wJyHfmXHOnpiTBF+5nGEY2Y5x6h+PshndQQQcZ?=
 =?us-ascii?Q?d/yy1IHDAeDbcpO0tJDy5gLV8MZX68/98eTdXjeSW8QP76M9mjlUJKjpjVKL?=
 =?us-ascii?Q?6fUahcToyNrqxAk/5hxNwFB3puTAuyXSgYgL+HJs9IWw5h/z4MTiJIbeAVo2?=
 =?us-ascii?Q?NbNn9OUjzBf4SznszCY6+26H03geui1r630tkNdLCwBl/oIKUUJTrQisfMTV?=
 =?us-ascii?Q?VdeYwDR5nv8QFEKD9+SUnVUGJL8HmD7dZmPgSG8Iy3sAKUyxFgD9Oxu2j02l?=
 =?us-ascii?Q?x+JH8yElGkYmR8IPpVldsRYwAn08HTyrX3/oMvV29wT107C1WDuluQ3IbGv7?=
 =?us-ascii?Q?0G9pJia0IpQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zlBFgn8gz6ZotLttiHn3//5q0d2dTfuj4UZA8++TWP13xrX8XmE2jC8X3KYc?=
 =?us-ascii?Q?V4UL30vq6nvZBo8z9+SwQ34TiWF+ER9N2gVzi5C5C65Z/yokJwjwKGvwvcOg?=
 =?us-ascii?Q?JGhQ2SrN5EGhZK2nSR+9E4ebQjOAyDTd2hLhdWJtSP+i2lYQKv8TT5c0g+td?=
 =?us-ascii?Q?GT5T39BLRAsUFVKHUAUQn3Q+aJlObGLuUXrtcQRicYsys/FQvM25xy8YjaLd?=
 =?us-ascii?Q?03FaFtIjpPkzPittyoAIxZqfYMae7OtYRN+WRRp62J5pfE58w2yYscKUQjWm?=
 =?us-ascii?Q?GduUaPxXSttCwMEKv6HkbJmDV77SM/Ql6XfuvXbQBMLzyMoTFkXX9nEZcC/W?=
 =?us-ascii?Q?p4sbaVZgbmojhtIvx37lPrahlrVDW4fe3JN2UCT2hN907p7Q223VM3q9WUJN?=
 =?us-ascii?Q?zvtUzbms53kWHMZ3J0GJ+3Y8R8TLADODF6cXDsst18eYCUfUfqtGaSOjroNV?=
 =?us-ascii?Q?ZHCxbe2Eeq3mw473uD7xLu19ZKI0Ye75QoWS/ph/pWSMC1Xy9HtvbaeOCV1F?=
 =?us-ascii?Q?1bZNK6ZiBaYgC6Zpb8dz8ojg79yRvvpUAvPHyHNsioo3cnh5pYs9gC607myg?=
 =?us-ascii?Q?0o4qE5BYyBABQsEpSjgt5XG2RbmX0R0p5kcBFTu4crNsgHVAuelGVpkiBK5K?=
 =?us-ascii?Q?DY/rGScVT+S8ijOVrU1kDY/w7iWh3wnL/SBJD/MHEGQ4KSxh88KONzjA5Y9P?=
 =?us-ascii?Q?IB4OLaI9YQqGSrnAoS4nJuTTeHsAyuaNDwPCyvqbUQadkBsxzoaBoM2RGR2U?=
 =?us-ascii?Q?oHDpbM639lt/52RLUx4QRUz6xIBf4ImqnY4jlfJIicaSld01+5THnVXAg0dl?=
 =?us-ascii?Q?TC6RobIHU/nDsQUF7lP0G9Jv0uvg2QR6jDWdFjmSuhNFfttuTJxW7DCpIzkL?=
 =?us-ascii?Q?e3sqHd+KdEY4R2S+mqP9s2Kyk2i3U9j2PmT7BtV/EoO3uLxGdAuw5WrT6Sat?=
 =?us-ascii?Q?Crm/x80mqCXE5mniBSFG/nA9odSlyH0sub0QbgcshmhHDoPjUejrWggGHbxY?=
 =?us-ascii?Q?zlI2wgzUKL10ZyzE0UIMd41Oho3kwYxGx0Est4/zrN8WIZvNw5mmOFRkXW1P?=
 =?us-ascii?Q?xaAQIVTNEhTtapttVl4vSeLd0YxFdgxDGnwh0URYAi88Xwh5a4xmYJDaeGyY?=
 =?us-ascii?Q?b0ZsiLBa/SKbJqCVCr7LL7SawfqAlaN1++JY0JKogP5sH5CfAcpGhrmx8J8L?=
 =?us-ascii?Q?jdqgcrQgb8LDl+dQLaXDHtDm/spdpK7NO9hoCP4hkPwsMI4RBGBMRNjX9erv?=
 =?us-ascii?Q?UwUXjIbZ9HL3SzAAaMIV+Vu5hdz0NId7iQEr5uLto68TYXlIIQ5iSVbRaD8k?=
 =?us-ascii?Q?xjB9AjZ48GQxwBPctpFuji2e0whsZNr1zec+g8C7ZtNApYO2qutf+J36PNj5?=
 =?us-ascii?Q?kRrU7JstnlFoZGaTW2LflibED4tLprrnksneNZkowI9habnudcGS+nB6GI6F?=
 =?us-ascii?Q?V6lDvmJ9RJ0I5w0pe6/sEimBw/E8rgOhIPDQioD2pnuVBBms6MefAmBLm4X8?=
 =?us-ascii?Q?tzknakN9guqnpJT3bUgovYFlgcU/Za9jnD29ncvmrBDQEeu+y37SWWpZuSWh?=
 =?us-ascii?Q?3/Xl7R3bN6QmV7OvGvacpcVXRe6/cey9RpzjFlOx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf76a48-93fb-49ab-d18e-08ddc08049a8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 13:38:58.2003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJcq+h1xVrP9WF1aPosrjMC0TmsEm01jVsJPur3LDFEa+T6agYs+nzxXCqXNgbhQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258

On Fri, Jul 11, 2025 at 06:25:01PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the iommufd tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/userspace-api/iommufd:335: include/uapi/linux/iommufd.h:1272: ERROR: Unexpected indentation. [docutils]
> 
> Introduced by commit
> 
>   c4e9e9b4227e ("iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC ioctl")

I fixed this with:

--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -1175,7 +1175,8 @@ enum iommu_hw_queue_type {
  * and @length.
  *
  * A vIOMMU can allocate multiple queues, but it must use a different @index per
- * type to separate each allocation, e.g.
+ * type to separate each allocation, e.g::
+ *
  *     Type1 HW queue0, Type1 HW queue1, Type2 HW queue0, ...
  */
 struct iommu_hw_queue_alloc {

Thanks,
Jason 

