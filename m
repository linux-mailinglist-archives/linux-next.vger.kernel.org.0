Return-Path: <linux-next+bounces-6173-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C90A7E90E
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 19:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD15F1886951
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 17:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA4E1917ED;
	Mon,  7 Apr 2025 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gh1MDt+u"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C013210180;
	Mon,  7 Apr 2025 17:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744048158; cv=fail; b=knpGK4CXMt2QI9A5nG+LnJhPmrirC6pSMuBqOpARtiVBnAXAimJg/lIg6Jy4mdBfC5ZsDCvdLEUPl4LeRGJv0nY8P3vdNPvuGMU/JU5rS0nY5XcnTSqxUWxDjWmn4eJ7AhNgqzqZajg67ktl7FluBwMuwOwAaYjC87cUvOP626c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744048158; c=relaxed/simple;
	bh=z6Z8hRPbyILxQsLlwG1nOr6zHkBFWBuXNn2Elgd2IJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KfAvj8ojDN6X9zNz9DmMMUfC0cNsnZNWtBsBLH8T582jhRMn+rOE5aDfxsEUxWkE964ICGdDOiVkzfFWH2xPRAX6FYeLWcbimrt4eSh5YgqHLVZ/ObACMyMcHeSiRhOE7RIrmL/1xx8d4ZbeADLUh8cGLiygXuVuvkNNilFh+/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gh1MDt+u; arc=fail smtp.client-ip=40.107.243.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urGcSNC/9zHVi6Jw5NhnEheoh4XUk46FCEC42yXvnXiRUE4veR6DVMHGKrJvMtnDYkSlyqP5N0i+QC6I4yTEb5wOKuq+jxSF3H+1BDbN3fHPEAf4yWa5hglHNCe3yVAo2rTVBxTZ5Tqz2lgUxv8Uneyd2KcXyYw+s4up4RGQHJGVOYIletWBf1GK1Yfz4joniqYg8SmbZ5HvVPaRD3CH6sREmiuYOoziMEclZJ6InOSb2hmYdPXdPdL5SQcaP7GVuZ/RYhW+4BOFeABGeK75xcWnL1uQM05pJHfTfV0OKj5de+Vu52Xy3KbhmZvPhsLjt+YwD8Toxe4kL6OrVVDmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p46eFQ7XuSOtxFwnz9GspSR+dLpEn063SmULlocQfsQ=;
 b=obNubYU8+Yo9VwVDeyBU7nvTVUjV8l5YEgw5Z4glWHVtXqV3g4Wvjh8v18tDpGrZ7W9ePURh0hBBnZBNyAK/j1VwFaXOn10Oj3HFvH/WC9heMAi5Qa9HPW2wd9tfSoKoCY66xPfGS3Omx92fynxt+ODkE91lqP86AxlpHezkIu+8k0GWtrfTgV1kussTt9HWR/osUvW3c34zL3tIV4OnIlQZ8NAhKrRUgUlkjWfU3eY+8GSX63pjRBByuA+y97CRNTBZuaTCI4z25MPSjLuE7wXfkJvsytgz3vB65GVu4xuAB1DgRRdkB7yEhdIhaWmL/pLwZGbAC69nO9zYOO19Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p46eFQ7XuSOtxFwnz9GspSR+dLpEn063SmULlocQfsQ=;
 b=Gh1MDt+uKrEBgBE8tyx3pYP9lZABGWPzRivThf4iliY6obfrQbD+1gxzjqgKN4iqKn/oWYpVD+uinsEumfE1w2nWxOttVon4NxmPJsfFdRaK1SZ2njnfr6hV7gP4IhB8JeOuIgD9s/32ZSsmw0k2eCJMgNWeWwCl/pqCvt/M69ZwO3EYyv6fqeQG85GqzIjeAvqC1r+Mb/JOekIO5Ow3QvCMCqe6ya1d/cd0JvN/qc5ERYLUQ6+j/8/ekjkFcMOtV8igqeLRfHP0j554trwa+fJbQ0L136DUFRm9DSKl/Z2lFZcYm/UfzLSLoBZQ9aoCZj9SFPcoE26HJ7V9XgFEXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 17:49:13 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Mon, 7 Apr 2025
 17:49:13 +0000
Date: Mon, 7 Apr 2025 14:49:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, linux-cxl@vger.kernel.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <20250407174910.GA1725933@nvidia.com>
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
 <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
 <20250331132439.GD10839@nvidia.com>
 <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH8PR12MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 36144d96-cb7d-476a-a499-08dd75fc80d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajV1THBENTNYaFY3d3NnMUxtdytpcHNDb3hINXgvOXFoWGR3Q01KdHpnQUFy?=
 =?utf-8?B?c0hpRjhTTDBUbThTWWh0eWgxVnJxL0pLTVNjRDIzOXVtZGkxYlFqT2FjMG0r?=
 =?utf-8?B?ZjZvTkl5ZUc1OG1JUitreUdtczJuekdXcUllWlV5RW56RWdUKzF5cHZ3MmF2?=
 =?utf-8?B?aWY3dENhWWthODJXUExUWWhReENhUkV4c2ZuTTg0OURMN2ZYZ3pZUkFBM0Yx?=
 =?utf-8?B?OG1YQWRKdHBxQzQ1em9nSGUxWFhYWDZvcnZQaDJBbmxwcUdEcWpEMlFkdklD?=
 =?utf-8?B?ZGIxTlRWTjlOZEpDTlo4Zi9keE5iQWIrNHU2WUdFM3lvMmVVY0VpcWU0eWJ6?=
 =?utf-8?B?SmduKzZ3VU1FeW92R0FlOFlJSkJnb3RiQ2U4WjVUTnZ6WWVNdXRGMytlQjZQ?=
 =?utf-8?B?WHR2ckQ5TUZIMzRvNUR3YXc3TndLU1J0SnBwY2E4VjR0dUYzV1V3TkxqOFRu?=
 =?utf-8?B?cjFPeG50QlQveWU1LzNucS9Mc2prUXh4QmYyV3AzakhaMmF2d0RFTEkxL2xv?=
 =?utf-8?B?anpQR29obkNHTzE0d1dUUmxjaTR6cEQzem96dG55S3dvekxGZDVGOGJSSncr?=
 =?utf-8?B?Wi9IVTRTeEJaelR0c3Q2SUVQVEdqM0NQbDR6Ykc5Ui9MbWZrNnBqNFduV0xM?=
 =?utf-8?B?cUdVenBMb0tWdDhnSU1xT3lORk8wZ3Y0U0ZSYzF2Mzd1N2pTUHQyVmJnNE5V?=
 =?utf-8?B?TGhCTHZXSVZUNndoMEprdzdBYklxT2hKT01kUnNFd1NSWFJ4STNVenluRi94?=
 =?utf-8?B?TXE0NnkySFJnbUFyUVJmZUdlbk81QUN1dUE4Ukt4MGxsODdOYUw3OXNWUXhj?=
 =?utf-8?B?RUhlTjIzNXNYQ2VpU3IvYWIwbXZlZGg2ZFBUQWZaZFd0cGlKZFVZQ0R5NE9I?=
 =?utf-8?B?OW8rZnc2YldndXBHc3ZpSEZpL2lZVndxa3R2TDVwTmxsSHZWZUY1WDFuK1h0?=
 =?utf-8?B?VnpEVTNKb0UxdWtuUmZjNVdJMEVRRDVBVHRSZFltUC8wOE96cUNWRG13N0tE?=
 =?utf-8?B?YS94dWNMejdUQmh3eWFnR1ROcTBKVXVJSXdZT1B6RGJsSElCemJremViTmhU?=
 =?utf-8?B?dEcyR2I2aHg1YkNXWU94Wkg5ZmFJZEFTQ05sTXdHaThlWkhnSDh1WmZ2Q3U2?=
 =?utf-8?B?OWVsOGd0aTNHMm1XL3pkRURmQlNBUEJGRkV6QW55MHJqa0pvRFExSHJTVGNV?=
 =?utf-8?B?dnZjUDBnS0lNTnllVXplNzRNQ2xqT0F4NGNWdEdSWU90TEJmanFLTXV5dkE4?=
 =?utf-8?B?bXJnVFpDWHNwTFJ6bWlTclNtdFhQV2VkN3p6WUEwUkZVcjJ4ci9tZmp5ZVR4?=
 =?utf-8?B?cG5OMzZXY05iRlg0elI2V2xNdm9pRUxKSzV3YlR2YWd3dGZva28yQ3FnK1dR?=
 =?utf-8?B?c2pmZXVpdm9SV0x1bW1YbGsyVU14eUNzSEZ0OXBFMnE4UTFLS3AwR2h3cE9X?=
 =?utf-8?B?N2lCN3lVSzJua25JZkxiZVhMaHNJNVlEU0lqaC81NzNJYVM1UnlhVGpId0lD?=
 =?utf-8?B?cDBvbFZOQzkrTGNNaDB5ZEE0YUFsalowYm1CSm91cHFJblhONGFPV2J2SGFM?=
 =?utf-8?B?QkxBQXgyL0lzbzNPME9mR0Y2ZUN3cE9pd2xRQThwSE1qdGRBalIySUlTL3FM?=
 =?utf-8?B?QmtLaHROZjJwUnlxdnZ3eitKT2MrcVN4Ump4LytRMlUzL3dJZnJoNmJ6UEdy?=
 =?utf-8?B?azh3M09iYlkyeFFKTW1PellEcTQwVVNDQVlWOVNUV3l3TzEyUCswRzBhZGRQ?=
 =?utf-8?B?clRFbTQ1bmMranZZc0duVEYyalJIbVErSStXdkRtL0Y1OXN6QldCSnFuT1RR?=
 =?utf-8?B?ZFc5V2JTeXlVSFBkSUtGZHhod1IvcUdWTW9pNElOTy83SnFvckl3Q00rZUN0?=
 =?utf-8?Q?cJpnHCSs6FYqm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUZjMWdhNTZvT0Q0MENBV2xoSVdLb3NuaEVBNytJdFVYWTlOZnZxU1hkMU5s?=
 =?utf-8?B?WXBnSSs4Wmprd1RFcHdZMUZFUStwQnJEL2hlbGE2a0MyYXhuVklrWm1pWVZV?=
 =?utf-8?B?d1FuUVNEb2lGdnk0cmVDRnlubW5oNFB1WGVSYmtrclBEZmVnT3A2WUZ2N2pl?=
 =?utf-8?B?dkNiUW01QU5jSFp1dXd5Z2RIMExKTFpBRjdtZ2R5UnJWM21qRVhnQ1pUUnEz?=
 =?utf-8?B?NVM0OHYzTlhXUlFvNmlRb3ZncmJFU0k0T2g4RTVPVmdxS1IraGZRN2prUSs4?=
 =?utf-8?B?d1UxQ21ybC9yNGlhVEs2ZG9wVDJ6S0ZWTU1UU05FcUN1VDRPTjhpUWJkUlZC?=
 =?utf-8?B?NW9mb3hCRmRWdzRVK2g2VnhzT0FpYTRvV3BONTF0eFVWRUc4NFVaUmhVQ24v?=
 =?utf-8?B?SlZBZGtKUTAwRWN5dlVmdVd1dnc1WHluQlFnN2x5ZUQ2NUVxMlVJZ2tNRjEv?=
 =?utf-8?B?enJnMDcrbStnN0hySDFidVFMR2ZjOHFBc1o0M2Yxb2pVWlVSWWFTVkRsOUdF?=
 =?utf-8?B?QmhpVndpNW9rRTZZUFBBLzl0dTZOMnFpNXdZTHBlTFVXVytBem9Id3B3Mjdk?=
 =?utf-8?B?Nm5DRnNSK3AwdWpMOW8vOVg1VnIxVW5yd0owZDlpYjRFYzJXTDFFWFl1amdu?=
 =?utf-8?B?Wm10NGRzQXV3Z1Fhc1Z2eThJd05wU1hocnVpMDlhdlBHTnMxYXJnWVNmdm1n?=
 =?utf-8?B?VG5PVVNDUDYxbDNMaXowMHMwMHBFdDBHNFRxbGRjYVdheE56V2YzRmpXUW4v?=
 =?utf-8?B?ZStWZGo3R3dXQjVmcVkzSllCZmVrUHRDOFhCendoTFBITjZHOFlNMHk5UGRZ?=
 =?utf-8?B?TXdUUVZtN3NaRTlkam43UjVLTkZWZzF6cjVFZlFXWHp3MVFMWTUvMWhzelpJ?=
 =?utf-8?B?Y05RZUw0TGtMUkRQT2ZkM043WG1hZTFUZExjYUIvWnl6VnUzTEgrbWVubTR6?=
 =?utf-8?B?V3dWR241dzlTa3VqV2N3anlObStTTkhlbjd1a2E4UjAxMUlSTGRkRzRROGdU?=
 =?utf-8?B?KzJlc3Q0QjJyckxlS1RQOUw4allEUTlUOTY2RnRmOW9zeGVqVkphekhTODg1?=
 =?utf-8?B?V2RNcFZTbURBVlNNWFJqMjUva3U4MFFRWlRjNCs5T1NxbGdGd1FyazJUVEt1?=
 =?utf-8?B?S1l3QW5qVm8zTnRQUHVxZEg3dkJYWW5RcU0yV21EY3FaajhJK0s1V285REJR?=
 =?utf-8?B?d0l4czk3eFVoc0NKMXc1c2FtcG1ZZGRSbkFDQUxtWGlUTjljWTZUUUo1UVV5?=
 =?utf-8?B?NlZLRVpEZE1rOXN6TUxtNFdLcDBJZDAzMDVVbmZUMVNPRFVTUDVqaGI0a05h?=
 =?utf-8?B?NnZCMGMwU0ZvZm9vd0l2NjZrWGl2RVVRbzZxUWNkMVhVd0hoU290dmlHbExu?=
 =?utf-8?B?ZVlqaEhYcm5sTmpERFJPYWlFdkZrTEtOaWV6ZFhFMUFKTmNVRVNlejlMakx5?=
 =?utf-8?B?TGY5eCtOcTRiMmlEK2VaWFgrQXlhNk9MUVpCTUtEYm16NUhkWE1jRDFNb2hq?=
 =?utf-8?B?NUZCcmM3ME5kU3gwYmZGeFBmRlIyUjBHdmwwSDJJVEF4RWxhWWszNVh5NldJ?=
 =?utf-8?B?LzhpbEF1SE5tUm90bTU0ZDlrdmxMZ2tGdHdSNGtnQ0lYL0JLV2YxaFFqQ2M4?=
 =?utf-8?B?d2t5R1NJTG9yK1VPTWkxYTBtTkx1Z3E2YTArcGZ5U3NCZE5ZTW8xU2NKcG16?=
 =?utf-8?B?bkkzVkJDY3Y0SG9hUVk4SlY2S0gwZmljQU1HWWVXQjd1a2VvdWsyVEJoQnZT?=
 =?utf-8?B?cXNSNkxBVVVzdEVZK2owak1hS1NLdTNVUFRqMDBoNUFtYXZ6SzBERVJGbVJa?=
 =?utf-8?B?SUFSZmMyMGdDbnNoZXJRbVZzRForUlZTK3hqK2tLM1VkZnpTMWdVczBuZ3Fs?=
 =?utf-8?B?KzdPcFptREVSaEFjQ2ZadTV5YnVrNmROaXJQNE1OLzNaZzdCR1pQNm5VeCtB?=
 =?utf-8?B?NTNQdGJ1OVNJS3Qyc0ZuTjVidENTU3lYMXlCVWxhREFuRDlITXVmbmI2TmFw?=
 =?utf-8?B?bENZazEwcG1CZTVNNHVxL0tCcm10Z0JoMXF2UGZBK3I2dXNqcGZwaEFPK0hx?=
 =?utf-8?B?eXp1TWtGSmI2cksxQXpVVFQxdVZtK2Q5QW9IVUplR2UvRWtTblBITnhZVkgz?=
 =?utf-8?Q?sAgSe+6vu0dsGvOAPikZ7C8+n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36144d96-cb7d-476a-a499-08dd75fc80d0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 17:49:13.6606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKqoxcuUx76shoGAcTNCbvs+siv1NmW8llvCV1/QG13hvztMJV5kFZdMkT58KkB9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6962

On Mon, Mar 31, 2025 at 09:54:55AM -0700, Dan Williams wrote:
> >From 6fbca9bb3e29f3a205861b9489a8fba46506e107 Mon Sep 17 00:00:00 2001
> From: Dan Williams <dan.j.williams@intel.com>
> Date: Mon, 31 Mar 2025 09:43:48 -0700
> Subject: [PATCH] fwctl/cxl: Fix uuid_t usage in uapi
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The uuid_t type is kernel internal, and Paul reports the following build
> error when it is used in a uapi header:
> 
>     usr/include/cxl/features.h:59:9: error: unknown type name ‘uuid_t’
> 
> Create a uuid type (__uapi_uuid_t) compatible with the longstanding
> definition uuid/uuid.h for userspace builds, and use uuid_t directly for
> kernel builds.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
> Closes: http://lore.kernel.org/f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop
> Fixes: 9b8e73cdb141 ("cxl: Move cxl feature command structs to user header")
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  include/uapi/cxl/features.h | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Applied thanks

Jason

