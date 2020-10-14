Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6D028E190
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 15:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgJNNnx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 09:43:53 -0400
Received: from mail-eopbgr00059.outbound.protection.outlook.com ([40.107.0.59]:59454
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727620AbgJNNnx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 09:43:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxeJDS8x2wD7UP0Y6fP480+Ep/dfPANnsmuwxEKbNxEMjFLXq12o1Xxjvp8QhW/6/GHQoa7wpQ6ki0N1OFzsoJwVXqUyW8E54OfZ0KiFjR7id1JPQb8E7yHOgOLtgbECeayIZq+Hd/5BeCFl67udGIca/HlBwErO6UWXat+ZwdiA5/06zGbV43Aj1aOGeLwnSypP6No8Gjd//5E5BLGAMER1TBPiuPUr0KyN+n+Xc6qZFo7rPaNY713pkYj97/n9licFl4fARtAy8ShXifTFaHyoo4iRXNzmhOhXUdJyIcutQpzhTJMwVW5Y0KUFisySEgKy4825pnIALlROuSDRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8Kn13Mof+8kEYFsyQSiNVy3ZPxnjgLja4wShPd29K8=;
 b=R43iOdGeNZh3p6ZlC4OZ8HaJToz3Lb3g+RRi2P94aq7qMuaxfDo/fwuqyDklclpBBjjhCN26uuwTkqYtYS3NL4EDdj0w1pfAUHwKpcI8RK4lYShH2tsIkIYouC7zU7ZMBo0ZM/+Z1vbwZyDTMVDUu3HiDL2clucpiGraOc6R6Ka7lFh4mydMbV3IvlQcIh8GpnLZNXZVR3sMyezm/6xn8IfnCCYnoVk63EpEJMc84BfHPomtqbQa4Z7iErvWRLjBFj7N9Jn8xHDohrxEMVl896WhIbAxokJl1muujibXlF8I/lfdTgMcEW1kL8SC5OWzELU4cc1cDPHZR8WTbiUjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8Kn13Mof+8kEYFsyQSiNVy3ZPxnjgLja4wShPd29K8=;
 b=BFLAv4cY+em11+kAxdDQRtzcJ1g3Yg5dVqF1lFz+aeXhWJd/q7B/saYc+j2hhLb0I7kVmShA47EkKJgO18QKxNWAIPcYE1D3pN1UP39shK4kKiypUuHH0jcvafD7cFmY+OphImFJA4F5MkH2BoXiaftkcJY05UDxXj/qWhnTFeY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0402MB2815.eurprd04.prod.outlook.com
 (2603:10a6:800:ae::16) by VI1PR0402MB3424.eurprd04.prod.outlook.com
 (2603:10a6:803:e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 13:43:48 +0000
Received: from VI1PR0402MB2815.eurprd04.prod.outlook.com
 ([fe80::6cf3:a10a:8242:602f]) by VI1PR0402MB2815.eurprd04.prod.outlook.com
 ([fe80::6cf3:a10a:8242:602f%11]) with mapi id 15.20.3455.032; Wed, 14 Oct
 2020 13:43:48 +0000
Subject: Re: linux-next: build failure after merge of the vfio tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Williamson <alex.williamson@redhat.com>,
        Bharat Bhushan <Bharat.Bhushan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201013140744.64937ecd@canb.auug.org.au>
 <276bf3f3-108b-fe60-4d17-d3f314e61db4@oss.nxp.com>
 <20201014091653.0ec43501@canb.auug.org.au>
From:   Diana Craciun OSS <diana.craciun@oss.nxp.com>
Message-ID: <7b80cbae-43e9-cb5b-ddd1-c4590fd87e18@oss.nxp.com>
Date:   Wed, 14 Oct 2020 16:43:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20201014091653.0ec43501@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [188.27.189.94]
X-ClientProxiedBy: AM0PR02CA0078.eurprd02.prod.outlook.com
 (2603:10a6:208:154::19) To VI1PR0402MB2815.eurprd04.prod.outlook.com
 (2603:10a6:800:ae::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.122] (188.27.189.94) by AM0PR02CA0078.eurprd02.prod.outlook.com (2603:10a6:208:154::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Wed, 14 Oct 2020 13:43:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6b720cf-b6e8-4b7b-1a25-08d870472d82
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3424:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3424792D8C2C1D1D2287EB80BE050@VI1PR0402MB3424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 10nHLPFwhlgxeAb92SRmGr8kaqWagzR6vVRHCgsdS1C6E87LMo50vTh3VoXtVEFN9bUTkGJl3vOkG5sRf0/9mW8DsVmu6WG0NbiL3zxwFtae0nVlFpkbA2FnQPW213A3lm3TH7g9k4PqqTMqD9P9Iz3G96vLfM89HyKTz9sLMIBhglz9D8KBIAJYdvW+egcKUqSGF8tb8CkHANWjmnH5P0kkVgIfxbSgZ/px04h4VacEcQOe3Do8swwE8IHRph3qBpiL29n+hfny0I0CbpDEctu2l2VF8f0bTWscr4Qkh+4Mtt1ijsrcIJZBakW/hMiEY/7GxXV33JkWkBsUlQqP5cHtJhCu751es3VI++50seFzb6nSEqe6RNWc5bpQ3t++
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB2815.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(66476007)(66946007)(66556008)(2616005)(16526019)(186003)(8936002)(956004)(478600001)(6916009)(26005)(54906003)(2906002)(4326008)(52116002)(31686004)(86362001)(31696002)(316002)(16576012)(53546011)(6486002)(8676002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: CCsd5YtcCIDGxAHdRAQf4DIgewQxL4/U2Isup5MJrFnDSEZx2v3O89v6efNyQDDIwqA30s9P/K9MIoKxjJOU/jP61X2shtYCe6xynmlo+276w7Eqe1ZGpVsiTK23i4+L2JI+H2JNzNKKEfTkGeNuNNbsv0ffmTLMLbkwGU8tHyBcXkYAXbOhimIZkBeTxvjK4GSgYyuk2yFoc1qrvH1yXNgtLZ08vhC2l3r7JiwZ686TRZli3zzdHSWntMajx9K/wrw2HC8HqnddHT4+txHXONt5cbKVPPF8fkZtA7DAyDvDtzmkpA+f48WAStRyhuCIf87D44nPWwDeDFB+Xf+HaZ9DcT0lpOaYZ09b217h44mUf2nNKyH9BVsF/dgq4D6EZJ5q0fAfs9Enf0MVfccuvTNELvDObfawJCHfV6aYZPTIAwNVx9ajp2DAOuJjy3tNFkXxmBabCtFwhY5cl0fjuUrWrwnPaUuBktG8Ikz1DPOOvR1Yitnr9oyvYM7yM7fL2/s3i04MGIIrQcKviTXSuqDTYChsSy92jIRguCK1CvVvdxTtxvvGk9ZgyY9aGTsy2Uyb+38OqE9gl8OT8iGUXGJjDNuwBfVet3eheLZxcGihi89R2MMaQvvs5G1IY0J08GWn2f3HeYaetLgmxYAGOA==
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b720cf-b6e8-4b7b-1a25-08d870472d82
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB2815.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 13:43:48.6383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9aZeKqDXe66HyiPeCVoNMrjzf2nEBY418PBHTtuifabe8K6d/s2gqDDjG9kghHjVVtIeRmt/Jldh9WeSXL+lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3424
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thank you. The errors indicate that, most likely, the fsl-mc-bus patches 
from char-misc-next are missing at this point. I have added the vfio 
patches on top of linux-next (which already contains the fsl-mc-bus 
patches) and built x86_64 allmodconfig. There were no errors.

Thanks,
Diana

On 10/14/2020 1:16 AM, Stephen Rothwell wrote:
> Hi Diana,
> 
> On Tue, 13 Oct 2020 18:56:07 +0300 Diana Craciun OSS <diana.craciun@oss.nxp.com> wrote:
>>
>> Hi,
>>
>> How does it fail? What's the error?
> 
> Sorry about that:
> 
> drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c: In function 'vfio_fsl_mc_set_irq_trigger':
> drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c:121:8: error: implicit declaration of function 'fsl_mc_populate_irq_pool' [-Werror=implicit-function-declaration]
>    121 |  ret = fsl_mc_populate_irq_pool(mc_cont,
>        |        ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c:122:4: error: 'FSL_MC_IRQ_POOL_MAX_TOTAL_IRQS' undeclared (first use in this function)
>    122 |    FSL_MC_IRQ_POOL_MAX_TOTAL_IRQS);
>        |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_release':
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:178:9: error: implicit declaration of function 'dprc_reset_container' [-Werror=implicit-function-declaration]
>    178 |   ret = dprc_reset_container(mc_cont->mc_io, 0,
>        |         ^~~~~~~~~~~~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:181:6: error: 'DPRC_RESET_OPTION_NON_RECURSIVE' undeclared (first use in this function)
>    181 |      DPRC_RESET_OPTION_NON_RECURSIVE);
>        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:181:6: note: each undeclared identifier is reported only once for each function it appears in
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:191:3: error: implicit declaration of function 'fsl_mc_cleanup_irq_pool' [-Werror=implicit-function-declaration]
>    191 |   fsl_mc_cleanup_irq_pool(mc_cont);
>        |   ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_ioctl':
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:316:9: error: 'DPRC_RESET_OPTION_NON_RECURSIVE' undeclared (first use in this function)
>    316 |         DPRC_RESET_OPTION_NON_RECURSIVE);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_mmap_mmio':
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:455:36: error: 'FSL_MC_REGION_CACHEABLE' undeclared (first use in this function)
>    455 |  region_cacheable = (region.type & FSL_MC_REGION_CACHEABLE) &&
>        |                                    ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:456:22: error: 'FSL_MC_REGION_SHAREABLE' undeclared (first use in this function)
>    456 |       (region.type & FSL_MC_REGION_SHAREABLE);
>        |                      ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_bus_notifier':
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:522:9: error: 'struct fsl_mc_device' has no member named 'driver_override'
>    522 |   mc_dev->driver_override = kasprintf(GFP_KERNEL, "%s",
>        |         ^~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:524:14: error: 'struct fsl_mc_device' has no member named 'driver_override'
>    524 |   if (!mc_dev->driver_override)
>        |              ^~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_init_device':
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:561:8: error: implicit declaration of function 'dprc_setup' [-Werror=implicit-function-declaration]
>    561 |  ret = dprc_setup(mc_dev);
>        |        ^~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:567:8: error: implicit declaration of function 'dprc_scan_container' [-Werror=implicit-function-declaration]
>    567 |  ret = dprc_scan_container(mc_dev, false);
>        |        ^~~~~~~~~~~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:576:2: error: implicit declaration of function 'dprc_remove_devices' [-Werror=implicit-function-declaration]
>    576 |  dprc_remove_devices(mc_dev, NULL, 0);
>        |  ^~~~~~~~~~~~~~~~~~~
> drivers/vfio/fsl-mc/vfio_fsl_mc.c:577:2: error: implicit declaration of function 'dprc_cleanup' [-Werror=implicit-function-declaration]
>    577 |  dprc_cleanup(mc_dev);
>        |  ^~~~~~~~~~~~
> 

