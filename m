Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0678B3A85F4
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 18:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFOQEJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 12:04:09 -0400
Received: from mail-mw2nam12on2044.outbound.protection.outlook.com ([40.107.244.44]:19425
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231748AbhFOQEH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 12:04:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaZOlw6qOcZTW/Z3dR2V9pFLcvsKbnqhQb2Pn6qsUiWVpd7i1DpHBMDdGAy+Kp066CkLtf38+cZ4uVFGvyU0GA4PUgxSt5lXoQMBDAw/vkjYnMr3sZiGouwrAWcQt21xkRCfiADTc2Ahh5pru53uSM3lz/+lfOAmGM8OLGj8DeiZA1dKxM8BLUI0xbKhT7O4Ak4JYfPCZ3/xGBRwtqZbOXRAZkYBT9Irv+6zCajcJvmY2apGNur3dz9RLkpPsYl1si+yMPWuIdhJrtANYZzM0zwZCaPQ5+IwxECfFKTxyJtqKCfcA2naymEvMydRbuMYXkz2AV0nKZ4Pb88ryPnKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKfScs1Z3XTFBS9khYOeK0Zy94oBuG0tzrlAbn2JoTU=;
 b=jYEcrV5oqlSTRtMv1Jv04wsLvt4ut+bckOAO17tfV6tAH275EAyz3nBuyNm67L+vLXOY/7HI4lrkSb8xFKhPcNiWZmoFY29vngqURWLpiEz8NemEoAMlnVpUJ20B/C3m7Ae/b3x6FfGylMfYmDCkC5C2qPQL+CcOuI3H8NERLYNzmeLXUwTD5mBFAEp5EbwhVb/Qyim+EGiBQZNPpAydvDGxRCnZtEnrIPQK9S9J370BloLga2VFLHhB91K6Pryd4rsuaov/+5f31+F+FXpcsvlYd8fmIqTWACsVh3tIbNPmpokAaeK2JMRmflUYzeN9gStAiDKeqFI5B05GXSnp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKfScs1Z3XTFBS9khYOeK0Zy94oBuG0tzrlAbn2JoTU=;
 b=Hyykc+SVuQUqmtop8eLG5hacKfpIFDYeKrwDXq7i4oYOeBxtxCfvNm/Lu+Asu/69bSgCat2yZg916FcGt2HFobWNELc4drbXMHk15f9HaXvbaML++yCrpNscaY6U2x2jNZjPn7fIS2b7BB3U65kO45WpCuUw/iUki2uMZQ3TlJrkrSqrX6Ic1THmfuX23GcdM6G7/eXCf2CG42PLQB4UWnPGzCIYKlAXW0SAh00hM1JcPS0FpR6RQRR2QNCy2RcIrZZl74gCxRjWPqNC7o7a0uHH4iFxnzdCSRRr0A2RPcpKN3qinF8YV5QyWTC+C8MZntnx3IuXRIGGu/nTQlYKfQ==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5094.namprd12.prod.outlook.com (2603:10b6:208:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Tue, 15 Jun
 2021 16:02:01 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%8]) with mapi id 15.20.4242.016; Tue, 15 Jun 2021
 16:02:00 +0000
Date:   Tue, 15 Jun 2021 13:01:59 -0300
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     "Saleem, Shiraz" <shiraz.saleem@intel.com>
Cc:     coverity-bot <keescook@chromium.org>,
        "Ismail, Mustafa" <mustafa.ismail@intel.com>,
        "Nikolova, Tatyana E" <tatyana.e.nikolova@intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Coverity: irdma_fill_device_info(): Null pointer dereferences
Message-ID: <20210615160159.GV1002214@nvidia.com>
References: <202106081056.E270F59@keescook>
 <6bdaf0a1b0e74782b63afba1ecbdd348@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bdaf0a1b0e74782b63afba1ecbdd348@intel.com>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by BL1PR13CA0180.namprd13.prod.outlook.com (2603:10b6:208:2bd::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Tue, 15 Jun 2021 16:02:00 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1ltBVn-007AeQ-RV; Tue, 15 Jun 2021 13:01:59 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68d1828e-2e2b-4484-cbcd-08d93016e905
X-MS-TrafficTypeDiagnostic: BL1PR12MB5094:
X-Microsoft-Antispam-PRVS: <BL1PR12MB50949C352C34269602518E8CC2309@BL1PR12MB5094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4uULAjPneonvLSf3JEUW6ei4i+ctNE0v4UC8EgD0MGhtGj1HhWGVc9PFFWQVHnDmMZ9lNZlWB4nO8tEgwx8lXsYdk31+53gJFZCMCggypUbehhIR3HgqAM2ZpazQT5OILZt/kTbY7IUazMOQEZFE0yHEuT/jfZJmYW3ojXEsFJ7GyjhbcJVfiI62mGhnaC5x4YkRjxytpIWflWP5cn16DYdvdIOGREBWiYrpxc23jaY61Nezjq09ymZFD/beX/mK4krOQVJB0vfS3iKkoBaDFC2Rwd58ih7DvmZOucu9qFQzqlXOUKDjbWEilpY1Jb+6uoYL27gayM1S8uyt5DJ7Zn96H4cBci4zK2+qG/uDTijU0WNG4DLgPC5kzO7F2BP/TDUL5fL0su82uTll8mZ7ksPkpNu3DImaJhwvZjFaPEtwG1EqtOuGTGi1CMkO5EQTEjWX4UtIt/HdcIi3RrUErS+MH3tYrZY3skwczyo8PdWBFvQo3zATqmzaCG3f3tiZ62oVHvLx6YdkBr8OjDEvPmfnKqe+DFXXA4+ZEwzSUKOFghRWGxRgKPGe79KkS+jnQnnoLEdOUxSw/vbjqo0j6dTEqQ1ANO0IGbyowmrpTwbfFIcH73gF/BQVVXUQdR3LVh6xEyPdmr6jw6Oshu6yEdFuqy9d0KJw2o01kSc/Sxuxxt+kGA7jKx8V8MwlJK3E/nmlGj5wXE1EZxModvSMKS3cCCSimNw78exMGugsYyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB5506.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(83380400001)(86362001)(2616005)(1076003)(426003)(4326008)(5660300002)(54906003)(33656002)(6916009)(2906002)(186003)(966005)(9746002)(8676002)(38100700002)(9786002)(498600001)(8936002)(26005)(66476007)(66946007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wy5n4CgAsp/2p4Y2TViK4hbByJuBL3u9kcw8MM0HmjIbZI7TKOPd/Dsu980S?=
 =?us-ascii?Q?9UWWFlDoQgfNUe45EzkPXBxdIvK7Jg2peLLvrm6ATwGVFbXQmY2qbVUz1bEp?=
 =?us-ascii?Q?uVfhJE/LZ44b8oqV/MHvnyLhTSWWNqI9BdDZldzkEwWXqddFL6eFtJRXgvPe?=
 =?us-ascii?Q?SKsiYrQ3NYcEtcM6tZCeWL9zzKE7haK8LtNCcrsTfAMBPFwMqQfbYT9Tnnv4?=
 =?us-ascii?Q?0vflIFZM0VgEVoYw6qkojwpWoLF2PqYkLUlfVSAkqL2bxD/Ukhhvd1J4nT1d?=
 =?us-ascii?Q?powzQG7L4/Vm/hrnvnazctcLd0zX2HkyMAtAsD7AZzDGZmcsbXYuZV6j26Th?=
 =?us-ascii?Q?Xuy8Y9tJX/y5b+Zmms6KWaiCIrLWcqksD4hrRxxRuXNMs2m09lrPnQYsba07?=
 =?us-ascii?Q?kvXHwGYzXJejCxdmXp4knkHAtBuz4/JHiRNAfXwOB+qtKGLmVdp5xWiWTRkO?=
 =?us-ascii?Q?+iEh0CjWexu0ZBCBJzQdX4gdB02uwB+J9s1IZvsnvTtXXVAYbUSQvXveLadW?=
 =?us-ascii?Q?adaAdEoq0bGU/CWQ6q8Tf4c1kLgM/XC1X6lICFiSL8CixNc+eKEhatRUdU0u?=
 =?us-ascii?Q?cqaioUJ7VacKl8Efbxlj3yXiqoCl5B6Yn23wBNRg5WAEZf+g05ee7+dcBPi4?=
 =?us-ascii?Q?2Et2sF5YGOC8PspWaNSPf2ARe3MFuZzD9HhDplPoSVJWiUwg+jSZ3pDebvsd?=
 =?us-ascii?Q?y0ZfGU0zM6Dll2G5/EEbNKHMFgFd8L/+/YG6qxydg6ux2npPcFZ0iQ9ybvLG?=
 =?us-ascii?Q?jg7VKjk4TBXiSjK4ogmwB1Jz3iG0NFD2XRK86VU7GLCDqET+3Caqbw7HU3CH?=
 =?us-ascii?Q?tGOlakIl4/Rruca9615ZSVFK0qjdskIfd8lB2+57kEtAPrld/zgLbrcawlw3?=
 =?us-ascii?Q?6EsTJ55BGUiBrvoV+DVFSOXnX0IZYpMu7uEBTh2BbZ7r2sK/EVuZot96swXN?=
 =?us-ascii?Q?zB53+NykZ8DR6r9/MLBd7NXiN/mEmn1vjhOjsRIXfaZvg5qXMInobsJ8KDeK?=
 =?us-ascii?Q?SVgPWMB8LFZMaaUPRKx5v5I6I+nEvlm3r3BreCWjRn+0V4+bBaXktaTIj+IU?=
 =?us-ascii?Q?bC8Y/BOaSOSxDd0jy1W6Kc7ky3xB07jpNCiTGpdSBynGiUrdbJD6PTgRHlTu?=
 =?us-ascii?Q?DnYUqk2Ul5yOOcEL76VjQ/Hb3SzR6w08plnAtQcAgRabEdeZ/2VPz3FphKW4?=
 =?us-ascii?Q?BeJvJXkxOg0Pt18zfPwrFyBjJ82gCJKnLEanSkKYjCXdawklQl+8uXbPn5fD?=
 =?us-ascii?Q?K4cy8pMHcJSIX9sNyyuaVWrQc0lxT8zOzU+1w5iqqOaj894e8RJgrOFBFd4q?=
 =?us-ascii?Q?lkNvw2sdCstXzsAOf9MdcfCB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d1828e-2e2b-4484-cbcd-08d93016e905
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 16:02:00.7576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RDL5iucr3NSYs1AD5GEZOhvvc2+UHBTDFXtR4z/gxFwfr0WOGeVT6GrPDvpZh4z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5094
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 15, 2021 at 03:58:52PM +0000, Saleem, Shiraz wrote:
> > Subject: Coverity: irdma_fill_device_info(): Null pointer dereferences
> > 
> > Hello!
> > 
> > This is an experimental semi-automated report about issues detected by Coverity
> > from a scan of next-20210608 as part of the linux-next scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified lines of
> > code (noted below) that were touched by commits:
> > 
> >   Wed Jun 2 19:55:16 2021 -0300
> >     8498a30e1b94 ("RDMA/irdma: Register auxiliary driver and implement private
> > channel OPs")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1505164:  Null pointer dereferences  (NULL_RETURNS)
> > /drivers/infiniband/hw/irdma/main.c: 230 in irdma_fill_device_info()
> > 224     	rf->gen_ops.register_qset = irdma_lan_register_qset;
> > 225     	rf->gen_ops.unregister_qset = irdma_lan_unregister_qset;
> > 226     	rf->hw.hw_addr = pf->hw.hw_addr;
> > 227     	rf->pcidev = pf->pdev;
> > 228     	rf->msix_count =  pf->num_rdma_msix;
> > 229     	rf->msix_entries = &pf->msix_entries[pf->rdma_base_vector];
> > vvv     CID 1505164:  Null pointer dereferences  (NULL_RETURNS)
> > vvv     Dereferencing "vsi", which is known to be "NULL".
> 
> This is a false +ve IMO.

It is because of this:

static inline struct ice_vsi *ice_get_main_vsi(struct ice_pf *pf)
{
        if (pf->vsi)
                return pf->vsi[0];

        return NULL;
}

If the above can't return null it should be rewritten

If something special about this case prevents null it should be
reworked in some way?

Jason
