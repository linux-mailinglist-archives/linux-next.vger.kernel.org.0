Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCD62D6E35
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 03:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389383AbgLKCrC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 21:47:02 -0500
Received: from mail-mw2nam10on2070.outbound.protection.outlook.com ([40.107.94.70]:56917
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391979AbgLKCqj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 21:46:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVzLoRfcznpB3Iqp5eX0Y/rKN8iB4n6Dp18xS3krgkZsbrpWSKpiIp7K1ebkiLu5SvPCtemDdZ2yygIP6JH8byuMbM6tJepTXodDnUBur6qzMJf9A8HMp2bHsnGjdgnMr5K629BXewR44Jn1c0TIDiyTPuVC/mdLlpaHz52iN0D98Y5gNxl2EEPqbP25UF5g7naLwcLVsCOk6ka3bqLHnrpppjS6ub6qlcUHJYEdgwcvnzJZZ/IMf+IV76hzLd2GlvhRnd6GgS6GOGjaAm0Mc7HeHA54oLEcEo6NnPgWL9ubleyJfA9eYSH+iuFa8Ks5L/xoBMce0N8SPSSC0xxmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VN6YNkix3GkIH7YxpRkhDUN8MPBR3kRdH0LsZxXxFG4=;
 b=lNAEHoXV4pXbcXruoj+PwyCn26lWTdU6Y/idm8OGdBu8SBH0mKIV8GwtxZBHdSZkMjLHZau9SYptoBhHnpfhX/FAOsoakeBJnnqd27xV/kEnzk/sFF1HbzZau/ScPKhv2ufU30/DvtAWRHe90bvTD9KPM7NDecvqaXWxgY8wUfGx/NNxkE7AP9ppXZlJadmbc7/EHaZl0S2/yZXDcwUTeksm4rosZKWXPpyQ51IFodHTsGk+7FnaO42+JkzbU8Vu7UGAMh7z0tNQxpNcx6wR+dfib8ZHLw56AAJ5wL8XQoYFX4qBIVUBP/24qH9S+pft6C5UiUxdNxTXSY5t4sgBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VN6YNkix3GkIH7YxpRkhDUN8MPBR3kRdH0LsZxXxFG4=;
 b=zoUZM73dgbgG6KFNWoQebOTi+JwbDLw0gZgEk8ptkPqQUQq3TU1ECN/k0mmvcA7KZjWduCDiqNdUGUrPrhccrgckOTUt4DUWCugakqT2GrRoCAzK4hN9HxU8oUymfjaC3q+O0rmR+KbVKuol2rdoKthtBA5lEDJBKv6XUILRJw8=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN6PR12MB2639.namprd12.prod.outlook.com (2603:10b6:805:75::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 02:45:45 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec%3]) with mapi id 15.20.3632.021; Fri, 11 Dec 2020
 02:45:45 +0000
From:   Ashish Kalra <Ashish.Kalra@amd.com>
To:     konrad.wilk@oracle.com
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        bp@alien8.de
Subject: [PATCH] x86,swiotlb: Fix build warning after merge of the SWIOTLB bounce buffer adjustment patch
Date:   Fri, 11 Dec 2020 02:45:33 +0000
Message-Id: <20201211024533.29182-1-Ashish.Kalra@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: DM5PR21CA0037.namprd21.prod.outlook.com
 (2603:10b6:3:ed::23) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by DM5PR21CA0037.namprd21.prod.outlook.com (2603:10b6:3:ed::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.5 via Frontend Transport; Fri, 11 Dec 2020 02:45:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cef92614-5ed2-4bc5-79cf-08d89d7edbe8
X-MS-TrafficTypeDiagnostic: SN6PR12MB2639:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2639E572F7A1957B2C461C818ECA0@SN6PR12MB2639.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2nVPtww0qXN5kTgudbS9d1e8X5Fmel+5tYboLL2mlQRQw7qvP7r7VaLyU8glBYL5gDdQVEv0klIuIKb32NfRhFuaapuW1mqjIgMRyyP25W4NrxQnPFgDFO7BVqpAvmDYpGLtFZJDPt9HWcEvihzqJZjSRmvETd0sFHeQtmuXm2MhAYfBxROSpZtdmyeS4zviE8EUG237e+Pw2hA/iJqei5NUy/t4nJxzN0EJxzKKLGhU/5DCWw4AXjv9VLtBKTAJ1rY11hI/ITNm98vwnrXQFrN9SN6mNwV6AH+crFD4mujRBY9nxt+r+wv52XwRjNSNIkZTJO5sMQHYJjgxPrkk27IhA+6vpobpye1xZMrdwIj2R15Vk7dkXoAJVJYt/Pnk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2767.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(7696005)(4326008)(4744005)(8676002)(186003)(34490700003)(52116002)(6916009)(83380400001)(1076003)(2906002)(36756003)(6666004)(956004)(8936002)(2616005)(66946007)(66476007)(5660300002)(66556008)(16526019)(6486002)(86362001)(26005)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K57sOjrexuvn9ESLszjYcPkNuz5fj+eHgR0aZBi94yQzF+BiZ1oimY66EJ+U?=
 =?us-ascii?Q?cU7BsRbjSC3xd0TNvosszdTLoTdzN+7VVtfhx6e9lKxfmt+dxWpjnnH4uVQi?=
 =?us-ascii?Q?z4uAS9zp7G17+qijh91jSusRvd2PWIDJ7+Y+c8Lqnie4k58F5iVuHHknVgTm?=
 =?us-ascii?Q?6u1NpKZuE4SG5gdaquxwqKulgd8WBxPnH44ROMKv+n36eE46Dq40V6pZn5dx?=
 =?us-ascii?Q?K/N04cd0OBv0AO6dCngK9X4NxpQcff7/HcgxG4DdAx+9KLFQ0EBULNDKkFQ4?=
 =?us-ascii?Q?ZLAirJxgHYZWe/H3S57/s3kv73TTAMQfn2PpZJ7ye2Zn7DucwGmObjHcdWD3?=
 =?us-ascii?Q?vrH3IWY9ygsK/0UHmNKfjWUJyFjIUxzzusjlG5gxT6+TILn52CRMdTXEunR2?=
 =?us-ascii?Q?2SD2aq7tquN/zQjhOdmuF/qb03jBytKaqVPoZiEYr15NesBPFyhHGgwyywpj?=
 =?us-ascii?Q?+DcKy2iJcFaK+l7m0+C0MjK2pzR8K32sky+AdodILnh0Fhvyp/qG7h5V0FEI?=
 =?us-ascii?Q?APgoDdnDgSy084yWtZrQfN6lXkuxS0pB5i/DJYFkaq3upxN+nYbABj+QG87a?=
 =?us-ascii?Q?iB0MtcsbvkrQAAMrH6RP30Pvyw8crOeLmp5LpWU+SYHMWwhd2KSv3mHnKM10?=
 =?us-ascii?Q?4veP1VRReDanjirVahX+pxPBrDD9HWm8IXQk985JV8DP9Q2byGscqcvQ51Id?=
 =?us-ascii?Q?OdB61l2b+EQH1H+8+ro+1mRgXweUUtPhpuHOFsTC230w8vGxCfo8rBrm5IKp?=
 =?us-ascii?Q?6yb0r2bzap+F+HLcgFNgGa1/wgNVePFxmMUyj92CNQtOhhxnrfZad2RP8x+g?=
 =?us-ascii?Q?whbJIUEkIMIGfElF9nbWphEny8/ZKYXiFocBAPUzq8SDR9kMU3f1gxOFOXge?=
 =?us-ascii?Q?ABCr1KoBGaaqqSxg9Qb4U45yI5a9eOjKP9LElYom6OMn9O89/hmgpRk+0v/j?=
 =?us-ascii?Q?qmaaTlMQzEulPnW3b5t2Y5mnA5MIVA+gkjZI5It+P1c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 02:45:45.2901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: cef92614-5ed2-4bc5-79cf-08d89d7edbe8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APwn5hW+YuF4/r9/OCRRVSgYyRjOEYPVylA12laAlj2M0r1/IJg6HDlm+ilDYPjGlYF//YSkUDYvhG+aap6IKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2639
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Ashish Kalra <ashish.kalra@amd.com>

Need to add "inline" to swiotlb_adjust_size() when
CONFIG_SWIOTLB is not defined.

Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 include/linux/swiotlb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 075748f367ea..e8074ff1b8c7 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -104,7 +104,7 @@ static inline bool is_swiotlb_active(void)
 	return false;
 }
 
-static void swiotlb_adjust_size(unsigned long new_size)
+static inline void swiotlb_adjust_size(unsigned long new_size)
 {
 }
 #endif /* CONFIG_SWIOTLB */
-- 
2.17.1

