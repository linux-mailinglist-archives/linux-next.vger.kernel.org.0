Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D245851A2
	for <lists+linux-next@lfdr.de>; Fri, 29 Jul 2022 16:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237143AbiG2Ofw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Jul 2022 10:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237170AbiG2Ofu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Jul 2022 10:35:50 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DD813D0B;
        Fri, 29 Jul 2022 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659105349; x=1690641349;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TWiSLf64rIu6gBi7cBa/tQyzg92LSisP0lLCgpLNSUw=;
  b=H6LKLU3G42rcXw7oDu06IhrvQ/eEVrMMUKT2/fjvLFqU3tY74xsd+mud
   sYJ1RXWmHCKIPBZSMIpracDoJZH6KzWUVEVRjgUddrdgGFZZJn/mLAFug
   HznCrO/dz+bv/3xBDTBwP2C8ZqPK2yAvM//zb7UTBbkGedLGgRQVvd9/1
   4E5QSg3bf2zT3w1VNLFvZyRzu88s9jlrk4WQRfLlEuLBK+um77jC0Qs+w
   nbXzKwITsLm4T/EOJS/I9RqRMJnms7TKJoOBK6RtxjxyOESBVWb2o9qG6
   xwN2J/TgivwOS6QJ1bMq9buP/JgFRJ02c8jP09CTpBX9mVuXex9qdMZQH
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="271818513"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="271818513"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 07:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="690751322"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2022 07:35:48 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 29 Jul 2022 07:35:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 29 Jul 2022 07:35:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 29 Jul 2022 07:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A55SLtnfDIULV+Cr5/KsHHfD/se2AQ6s3yRq6oeijgRHxjXy3bjNeXSqo+EMnoqj1RLb2ogwZBv68flAMhe9Esje5b7frMo4yVh0HWLUh3aw+9xPmnpmMlhu2y2StzlonapIeFOF1gzDGSF2aeaHZBqPNznfWYCMo1Tuk/MUX/CkQGkScNUSEwAGuqoT4x5oL3Whq8NjjTMoklIb8y2zODzjtrwdd0vZK80sD7ANJ9B5gCd8hulBzItnvheBS06j2wT+x6qIAd4S6LpLQc0RUKx5dQ+rZ74qQE+eE29GIUa4YGAYkliPQeJ0YaQR9CCM+7crfYSkzTUPrXbIGUwKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82ynwC3pgOT/3HpmRKV4GGQdaaLDvHt4EUC8DbL542Y=;
 b=Ch2LDwNTxr4oDH4GjOGUV7v7yBAylWl0CYgAXBNJEY1uU0d2xubS5EX+lXX3ZULS59MnPlbUotm8E4Rkr/M7hrf8quQ6HUvucMQY8SRtXgApPCl3WmZ7G0plMh+xjmylrtkwFlHDRtU5pGAMCrS+KvjqD397y0zJ6ooDZkEeDT45jIMFRApkBN9UJWqupw5scfu+mqygG1Tz7vh3EsD4hY67VQm3v0E+XcRZGSwRCNZY7s3fyDe3PeaC+jBMC0uAlQ6TtxPek+MyDguqKftnLmI0D6JEcJEOQHY1kY5gI5PvYOtY49qzfnNGfsj3o4EH9HkkoAcWa6qxquQIH71lyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20) by BL3PR11MB6364.namprd11.prod.outlook.com
 (2603:10b6:208:3b7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Fri, 29 Jul
 2022 14:35:45 +0000
Received: from MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::9847:345e:4c5b:ca12]) by MWHPR1101MB2126.namprd11.prod.outlook.com
 ([fe80::9847:345e:4c5b:ca12%6]) with mapi id 15.20.5482.012; Fri, 29 Jul 2022
 14:35:45 +0000
Date:   Fri, 29 Jul 2022 07:35:43 -0700
From:   Dan Williams <dan.j.williams@intel.com>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Sachin Sant <sachinp@linux.ibm.com>,
        <linux-cxl@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>
CC:     <linuxppc-dev@lists.ozlabs.org>, <linux-next@vger.kernel.org>
Subject: Re: [linux-next] Build failure drivers/cxl/cxl_pmem (powerpc)
Message-ID: <62e3f03f655d1_38ffa7294d1@dwillia2-xfh.jf.intel.com.notmuch>
References: <7FF6D18F-2F85-4FFC-96B8-D1B1E8D8D622@linux.ibm.com>
 <87sfmkbfyg.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87sfmkbfyg.fsf@mpe.ellerman.id.au>
X-ClientProxiedBy: BYAPR08CA0060.namprd08.prod.outlook.com
 (2603:10b6:a03:117::37) To MWHPR1101MB2126.namprd11.prod.outlook.com
 (2603:10b6:301:50::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b6cb176-d886-40bd-47c7-08da716f9f5a
X-MS-TrafficTypeDiagnostic: BL3PR11MB6364:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gS5u6gyZZLAXbUlrqF8x/6a+MCH5eY3dANx6UHAK4yGWVH0DXoII+FrDM0wwB9k5agHFek0PVpTLoqg1kTtEViYpdrlRKJZ6kc/pNwVZp5VoAyQSLTP7IZXkG5PQpM6Hw5UMyPmx77O+JcBnN33M0kujEVT6bj1blyW5gHMcvyzAItT3GohresLE7H7w71zBPCeJheW0cVYczMV0WBEubHDNcaaW9LluihOjIdu/2RdJJpyy7x7+6nn954MBz9WVyXjGDY6IRzihzScswSCajL3PL5tGxYtlLQSsPN1/v0G5lOHUFw2+OXzzpiFqAoNwSR7CDnPfz0QNrwJ6vVi3p/9lG/g5ziSEOsMd8UracHlOg23fJiWeDmJu94jBq6iH3eaUsxR8kWYb4UGZSLTHRag0dq/X/vmN8JsYMMyEdP62lmO5wmEkSDtLTMnalofnbk//w16NEDLSpAAtCZybparQ512nIvKIgkqpvWbNaeryoRKaQM7TVgXPGCm64HfsEKmuRP49LqDlXrBEA5OMGzFMk3Ck0N9BICXWxTFUilihokeukFOpcezGIM9VFr1yAdSythpEMWdm9njI6VbnRhCbImJl0ZrwcK4CKIpqbmToVMJXe5D99CORdKUIgKrQJzSQGoYIirK6Ev27Lbk95EkFKgPvHParcKJqVSpE27JDBo1Ph/2NOt6tluoItviKo6RMM4ENFc5OljSVxu89qhk9cm1Fv/Q/JQGrdnYtO8BXySNj61zPEzevea8E/W5l
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(39860400002)(346002)(366004)(82960400001)(316002)(38100700002)(6506007)(41300700001)(5660300002)(8936002)(2906002)(186003)(8676002)(4326008)(66946007)(66556008)(66476007)(478600001)(6512007)(9686003)(86362001)(26005)(110136005)(4744005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x4ctch8JwFqnG0rD3wlkb2E1AWdMo+MtdNBcIcMpk/kviS5ZK8UVjt2QLL99?=
 =?us-ascii?Q?AE/skb15c2v50kjV8EQj+LGsDH7t/wsrre5qTtoWjhk12Q8vaFIqPpwJvSaM?=
 =?us-ascii?Q?zrDMfiJ2dp49B2xRUvNzjGJYUCa9KjiM1TelslypyDDyyCRmDPj/ASw919Rj?=
 =?us-ascii?Q?DRPr1Rr3OdR1lRzWQlRSoA4l1fFUN66EO+sQ2ajEnKu/vzHqDwWQkC7LYXfr?=
 =?us-ascii?Q?zrdpTFvCi+TarS6oXMDgm+dSIrYnwHrJCCzvaqKKi27BnsY8ceHu4zn9Dzrj?=
 =?us-ascii?Q?GqG0JiLpfPyF4SMxXpDTHwlGVQv3KT5eyW1XtOaE0g7945WhSSzoKaoPVSSR?=
 =?us-ascii?Q?ZCEM1YSWPWQEzvGi1h1MilEGzg5BPAgvBJ13XP42D8xcwVLPuJn9N8UtRu0Z?=
 =?us-ascii?Q?y8ouEtZoOLi+Jd0tBpGurBl74HXdOu6PJB0Y0TwiQHdUKcqWLfG6nI0MnJsM?=
 =?us-ascii?Q?9IhDvSJyILFeyKA1hYBmD6xBV6H+5dTvL8NzIAl6A4VhzzBHdaahN16iYxk0?=
 =?us-ascii?Q?eHWcogmI2SIMcTyQG4B2sSyrsQfL8CvWGSBkM3T2z77RcJPuDK+XnoGeoR37?=
 =?us-ascii?Q?vVd7uaJTVErhlYOI8If2iDSs38ZxvoWAYV006C7NKnX13Cmzow/UBG/HCVGc?=
 =?us-ascii?Q?qFo/+5Bwuol1H014J21Xe1FbsY4S6nV2tx0DWPEP2qm7HU9EaNStcJAG7cEM?=
 =?us-ascii?Q?/ElgBnWoYRJIElUV0zw2yHSLN/XTLwkMtLh9cLpEdZwWJzdisBzaN5h2v1tY?=
 =?us-ascii?Q?pyZFL6Yf23wLG7WuFU1j3tJVEVQcyk/ET7ETEuyRyBXRFfZ8+u+rM6l2q8RY?=
 =?us-ascii?Q?hf/R/kGUXsmcZT2MwhSxR+hGxNmAYrv1xK0ukjlmGY9ywzbpjMAxLsqrEMnL?=
 =?us-ascii?Q?BLZBBIbH7V1SQa4LSOlk1D9PZkm1UxzcVJ0wZNg6JAB6qUpfPpREjlb0DAqP?=
 =?us-ascii?Q?o79nTW4Yf6dVRHJSkbS2tot+O7Bezf3PoBsJ0ovUSxnHgtRepZPFKLcaFELW?=
 =?us-ascii?Q?jlQjZc32eRdKCDji0ZeZ/tvzeHlwuFPfKXq2i4ie45uYi1HQJDty91RTL71y?=
 =?us-ascii?Q?1SS5du5nQuEJ3FcGsll8HyvlKzCamLbiJjWoinVaBQjEqptILn0hUpRdzDWE?=
 =?us-ascii?Q?hYPqhG+gGbmwLLi5uY12D9Lx+olDi62GWdC/dxLtOYIAlqoV+k3DsE8CRjYU?=
 =?us-ascii?Q?YGI/1v8syL2LEhgAqJVBd0VgIIt/PrKhjcbyp8qMYwtFM8u2Gb4zd46hT++c?=
 =?us-ascii?Q?CVrDZ1glqBHBHaWOBA6HElR0H+2rdeID3ad/VrfG2+XBA1O5NSDbM5Zqtrn4?=
 =?us-ascii?Q?UDqc7lgaEuQB1gzcWVgHF6Czz9MaT9pIKPLCsADO1Cit2F6FioJUn2SOUp+Z?=
 =?us-ascii?Q?ku2aXZsSs9EJdRcs+x6Cxg2QTRHjHl+pK3cs6+gSVfeC0GrQywB/qVLuNKv9?=
 =?us-ascii?Q?vmaiKhei27PDZKg9GWw+X8N2U7ICNyX2cKALIcLWrt1W5cxJpMqmbq1EFWjv?=
 =?us-ascii?Q?h6slTH2Neetktg0PRqDcIcLEiMXR8sSE25U4l2tol+bcAnp53AyREn/4f67i?=
 =?us-ascii?Q?0PP5cIpYP4XZySfWpcbR6URdmVn92oObYKF8gb+xp0Q3XF10AAADnZY/WT7y?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6cb176-d886-40bd-47c7-08da716f9f5a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 14:35:45.7492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBPY1EfYsgJJSue7pdn5vznjKDtNUrEOpFLc6F5VOleLyusEas9teoZuZInSjE/EjxqZ6hAkzX66YrwTWZkg3RFrpxG7lk1CDW0NWpwnkJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Michael Ellerman wrote:
> Sachin Sant <sachinp@linux.ibm.com> writes:
> > Linux-next (5.19.0-rc8-next-20220728) fails to build on powerpc with
> > following error:
> >
> > ERROR: modpost: "memory_add_physaddr_to_nid" [drivers/cxl/cxl_pmem.ko] undefined!
> > make[1]: *** [scripts/Makefile.modpost:128: modules-only.symvers] Error 1
> >
> > The code in question was last changed by following patch:
> >
> > commit 04ad63f086d1
> >        cxl/region: Introduce cxl_pmem_region objects
> 
> This should fix it.
> 
> Dan, do you want to apply that on top of your tree to reduce the window
> of breakage?

Yes, will apply, thanks.
