Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8BF3DA262
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 13:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234213AbhG2Lox (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 07:44:53 -0400
Received: from mail-bn8nam12on2059.outbound.protection.outlook.com ([40.107.237.59]:63136
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230036AbhG2Low (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jul 2021 07:44:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbPr2Z+dNWzK3K0pwCFk7QdWD9t7hXTfy7DMrG7UZU/St184n8Kaj90XpkPTjWj/spZOJkl6bFweSFIauAqQyBydRvmld6oLwICrSVpjucnnlv3Pc67WeiZsmWYxM8rk9wCiZKDbwPunudtd2+FOItxXxtqt1nlBAlo8B7dgtzUhocIztppQ9vz2iW70xQnKzEP3tNtC9hsAJXa1fq0qF+RTxPRK+qGEZSP+YoUGAJJTcSRhEa0x83aMgG2K7qjyzdm/qX52Sl9pfLnzylB0+NRd/hTCenbk7ckv0Ssom9dX02kGj9U5RvlLE0tudT2CZFB8QD7yVEaqOJPpqIdDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRaSi2MIDrCyXUc5ZuHfQ7X9k4e2jbEQxzlTE/FFuS8=;
 b=BI2rZbhvHee4tS2LqVaXikRYxINT9nQjauBFDCaKETNtMnhKlB69AKUU04kdZSwZGZ70Z+7qofi8YKVZdGTg/gTCtrjxyJgR6oy9R9Bb8/yqCrpzyNJzXUtf+u5vkdBYKXBo2UvDwlw3TbNRv11jYtphahsDUTTK3xW3VF6O3Zl0h1Xg5LthSZhN5Sw9cp6pw4vdrTI4WPTeqGDUVdAb+Wtc/xVjsBe53BvekaYpOHrWFZDE2d5HwUqeOcfCNuh1zbO9Zq4mgN7K4zfvYyipwEmlAZnGLSYtbzYB4T90DE4iGCLVuoeyo+vqkX6SM8yJ7SlC6WKQzpQmHzH3VeOxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRaSi2MIDrCyXUc5ZuHfQ7X9k4e2jbEQxzlTE/FFuS8=;
 b=hkTnuZpGB0CP756mT8+sgzSltrYRSfSoayP6zitdDQegJgjRQvczEwwzE2n8H4qz/Zs606RH7ozWeckcZI/7GPyRoLSxAPzmb80H4B4F9KJNsiy2nx+sK+m2RflN4Hlo55aQXXC87HiisxZCSKTlc5XyQZ/niAxrDLvznTltnmk=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Thu, 29 Jul
 2021 11:44:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.033; Thu, 29 Jul 2021
 11:44:48 +0000
Subject: Re: linux-next: manual merge of the drm-msm tree with the drm-next
 tree
To:     Mark Brown <broonie@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
References: <20210729111027.33028-1-broonie@kernel.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2306c0c4-1312-fcc7-1ed3-406fbd72cf63@amd.com>
Date:   Thu, 29 Jul 2021 13:44:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210729111027.33028-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e62:c902:d5a3:6f28] (2a02:908:1252:fb60:3e62:c902:d5a3:6f28) by FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.9 via Frontend Transport; Thu, 29 Jul 2021 11:44:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cc7805f-2e36-4c11-c10d-08d95286448c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4111EED0016955DC104AE29583EB9@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/MAsraZ/cUG+aZ2Iqa4ThOf9v07qctnmV/TdHpTRDI8J2ze7om6nWQEUUKLxhuWC4OmhbWV6rkjSilmweNZVCwYTXUDvNMH23zliKP1eukqPb3epT2gh02PzRkNfgikQke/qC346Ywai7PoY885i80Sq/XSRLH562qggpqu7coUbsg+u2IlNvN+n/tNs/5so+j2dwljCzDd6AQiO/Ym/NPn0VQfAw200OHtItF8uCSHrdptwfC2v9KN0SdEcr0iPeriznOCS5qYZ4MEe6LChjbpAxLRe+cZXpBaIH0YoqnQEZOA3DfMtXrWA1E8TVSa0PJEDSwIdmtKIpCZFCxPjTvpE6gQuXnLRHHHk5cvwprGkXhVDWFJdd+MH8A8kNSXd6bplk9PnhDVAZIDnI0uIqAWkjJyQXiJnO74UBkQEbqlcvcu1eBUkLN+9jI8/JTrbgqbzOHpNR9J8urJspkYb4MAkDYal8xc7zeFjkHPzSISIXr1/JNaWO3R7iG/L3kb9veWmr3jU4aEaS3MP3f6bbST301SZZMSyqCf5htlXfrpJY+mewUIduRSgwakLY3HCu1H5Zq5B1kwgQq+i7yFydXojoRF7gb+XDQZ4Qlv319jD1z1rTU9EYhp2SSRrJ/1pxzbtqj5/R7Qae9QbcU3ZgYhqGC+OmuKdoiKtJaXlEBXAl2lmwo+mdHiMmQv8CuxJAvnb8RcGCyuMqqvjEtSZDp1cD1k8+1rY0PReFIi8bFcfFtmMUOa7dqhqpXRA/J1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(54906003)(110136005)(66946007)(31696002)(66556008)(8936002)(8676002)(66476007)(5660300002)(6666004)(2616005)(31686004)(186003)(316002)(478600001)(2906002)(6486002)(86362001)(38100700002)(36756003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2hiMXJtUWxpUCtJb0llekRaMVVCT1c3eHBoaTZodFY4QkI3RFFXaG16VGIv?=
 =?utf-8?B?RTBXOHdRTFd1QnlHZ1pYRVpBZkl4T3hWM3o3SVJuVEJBSGlsQzVWUXdSeGp4?=
 =?utf-8?B?ZUdFL3B1SURwRGpyeWRTUStMSWNVMU1YV1RJUDZLQmN2enZRQ2poMThJQ080?=
 =?utf-8?B?ZkNRK0ZrZkF5WS9tc2Vkd0J6NmZvMjRaWVVRYTNEbTJmSXZ1VTdCTGtOcFFp?=
 =?utf-8?B?emlLMS9rNkJLdlIybVRkYWN5WUZNMTRCTWFkdFo3cW12bktZWUx5cEdWdkxY?=
 =?utf-8?B?SzhUTVpxS3NtMnNXSjE4Ry9tNXBOMkVIVGRjMWxmZXBCSnVQZGhwempIOXFs?=
 =?utf-8?B?V0dQZlhzTzhoMjY3WmNYUVlDNHArV0xUNVJmMG9MVDdNYlc5M1VjYkwvdmQ1?=
 =?utf-8?B?YXRSU0tZVUZpblY0M0h5RFhQT0tqdFNiUVhUQ2VUdWIvZVlRdzFES21MZ0hx?=
 =?utf-8?B?ZFh5aDRNcFJQN0VsNCs3YzRDMCtFL0syd2NFV3QwYVlYSDhWcG5oOE9PRGpF?=
 =?utf-8?B?aVRnblZQeGpTemV0TlpwTnk3SEV4czVBcHNKQnhBNVoydGI1UFNiY2lxNTJU?=
 =?utf-8?B?R3NqcTlJRGVseW14dEhuY05jbzFzMGF2U1lic1ZtYkFHUkk3blpIRHlKWEZx?=
 =?utf-8?B?SEZFc1BhUmJUY1ZpRXlFYm5zSnVCRXBISkRUc050bDF6V3ZxS1pHQzdOU0gw?=
 =?utf-8?B?S2xPUlZmZVNCWGlLSHg1b0xEZUJyYy9KbFRlalIxOFY0aFp3elZtMXVDbDFU?=
 =?utf-8?B?M2JJeUphV2dXV2Q5LzlCUnY1WFU5M1hxMTIxaWZRUWZ2WjJlN2dzQ0JKTEdX?=
 =?utf-8?B?eEcwNmtzZ1ZOS1Q5eU1zNElSQ3gzSWNGREJUWGRaVXREOWVpOTc0VFc3MFcr?=
 =?utf-8?B?VksxY1JNSWJmVjJ0QTgwL0pjZGkyb1MrVGI2M0w3eDVYLzlxTTg5bjJ1TFRv?=
 =?utf-8?B?MlJBWkZjcXBXUUI1THZWTFFrVXl3QTVuZDV1OVlndnk1T2lVRXYwcTdITCtJ?=
 =?utf-8?B?bXZMMmpteFRML0NGTXBYOVhMSmVLUFljNHRmaWNEUG5kTnpDdjcxMDJQTEFn?=
 =?utf-8?B?TmNtdjVQWHl2MFFvRHNZUTRZUzVYMmtyM0h5MWxLYkZYLzJxenJQcDJoVVQ2?=
 =?utf-8?B?aU5oY3JmZlBoNDQzdE9nTlU1TzJqYnI5Q0h2VktZSUkzOEhVTzJCTENBaEpC?=
 =?utf-8?B?UHpsdm9DMGpZUjRvM1dtUFZoZXVwVXhlZTZ3RlpXNS85VXZHaUVMOU5iK1o2?=
 =?utf-8?B?UVNCeW82YXlISGNoZGRKRkh3M0d4NTJXOW1TUmVvMW5lKzZpTG9FQUdMa2g4?=
 =?utf-8?B?MFRNd0V1ZUswVjdOY0pmcEpvam1KeXlDWHFNaG5yNVYrRXJuNEF0MDZlMU9a?=
 =?utf-8?B?VHVsQnBuWUIrRklJdWhWMER3ekJTd2g2WmMvS0d6YTQ4OVV3YktGWGp2b3ZH?=
 =?utf-8?B?Wmk0Ym9IR1loYW8ybGRWUDBpUkI5TEhDTGk4ajQydWNNYit2SzQ2S210Qm83?=
 =?utf-8?B?YmhTZUpnNGo0cUFOQXFCTDBzeWdacy96S0FJdkxjYnIxTkdkSTczNjJaM3d6?=
 =?utf-8?B?YnQybXlJN2V5TmduS1RabGY1UUtIaDBFOGdLSmg2MWprWVI4aW1LcitBdXF2?=
 =?utf-8?B?d0lIQkpBdFVrVzU2SGZZSS9UVXAwRUR2ZjBraGcwRzRlcHZaZzRuR2NjWGg2?=
 =?utf-8?B?WEowOFhhVUV0T2ZVWlkvQTlFTTlyZmVkcWs5WUxWM25FbERzZnMrT0xPS2Fi?=
 =?utf-8?B?a0ZKMklZZkZ0NXdHUUdyM3U2b2pGclkwTUxrb1lpQUF3VFBiT0xXaEd0TmZ6?=
 =?utf-8?B?SDVKT1l3MHZydEEwaFJ1anh6V21vLzFLcXA1NlJUU3BOMzk4ZFk1UmtWN01k?=
 =?utf-8?Q?ZeUQVDn/ZuEXX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc7805f-2e36-4c11-c10d-08d95286448c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 11:44:48.0265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9TkMGMX37RG8mwkxvbRSqTbXyZQ7xLWW2dj2fFgJki3fqRKcGxvMEUlvlnQabTA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mark,

Am 29.07.21 um 13:10 schrieb Mark Brown:
> Hi all,
>
> Today's linux-next merge of the drm-msm tree got a conflict in:
>
>    drivers/gpu/drm/msm/msm_gem.c
>
> between commit:
>
>    60f800b2bdfa ("drm/msm: always wait for the exclusive fence")
>
> from the drm-next tree and commit:
>
>    1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
>
> from the drm-msm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc drivers/gpu/drm/msm/msm_gem.c
> index 39c35414d7b5,5db07fc287ad..000000000000
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c

thanks for the fixup, but something went wrong here. The diff is just empty.

Any idea what's going on?

Regards,
Christian.
