Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7A376E67E
	for <lists+linux-next@lfdr.de>; Thu,  3 Aug 2023 13:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233658AbjHCLN6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Aug 2023 07:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234234AbjHCLNw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Aug 2023 07:13:52 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::607])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39662129
        for <linux-next@vger.kernel.org>; Thu,  3 Aug 2023 04:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVJJcnyM+HsQj5pv3lYaUJabqQsi6OMqnr6GPSGL3agF/hB48fivKGtqN6pusboi+frCTJX2Xt3pMVW78dIZgUs06/EYADH+G/eZ8/Wv0mv/ICCe4TJZm6UNnwwpD5FHOlEvjKOkHPwYQScGO3JPwIz5WJrj85urvGTYJRpoolN5DWVtHVt45VyQGUBa7dN9wgcIqNwyI7ckvotVb6R6qsGnRbJpsohj/Z9GC/9vLE/VlL4CLXN0+dPrPenSXllwPIpppbIMTz73bWdkDoC0mF61wKeUAG7zILf63/z8zI3e6UOOqldREjhXSUkLcb0ubYRkCpUA20xMX4IsnJthdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IdfbGZiVkUHi2g3OT6dj5ZP+WzCzU7H6ZQkM8b+25c=;
 b=e70exQPThFGVwBKaNXaBhxesvRJhmiAsKAumO4vikimMcH2GAYDqtlqHann+Yy9vh3jqfIb9pL/dk5hRYUYBdKT9QZzn1EB6vkQwM7E1WrZU1jftQBIY1T+YOMXSWNRx+CgU6/gT63SdmW4sw0JA6xWQT3T6QnBEjIy63G38qKAIXn1VYYhCbdJ4gUrTThCyEFyrKHBSFJBkJ6wzC/+nYebkJ+LJ+ISxZoCJMzNLNi9AvTdEeDGVAccqk9VYNkjLMjiYOTxVCGpfTREaLe9KgguxXaEXq9XSOfwJmcXOXptuSyGrboC0joZqh28IKfZ2h75B6IZn9UGydGlkGNwhPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IdfbGZiVkUHi2g3OT6dj5ZP+WzCzU7H6ZQkM8b+25c=;
 b=W9VwJfkC2k2XJbuFNJIvJTshfAqjdc8b7tP1tMxIloB47C/2pCsnyYhhZUE7hNpHuqV27IMYBPByqRNZzdpWCU6VYOuLSea8aXslaxLu3hjpUj0BTlNFtKjhNmMv5dqHwfHbik4Ll1CrWddNWpapFBj2tZrtu0WoYxyplZkf3ag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by BY5PR12MB5013.namprd12.prod.outlook.com (2603:10b6:a03:1dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 11:13:43 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::ee82:d062:ad1f:ddcd]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::ee82:d062:ad1f:ddcd%6]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 11:13:43 +0000
Message-ID: <e0dbf903-b122-4e81-0568-a27e1daa0fb4@amd.com>
Date:   Thu, 3 Aug 2023 16:43:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
X-Mozilla-News-Host: news://54.189.247.149:119
Content-Language: en-US
To:     linux-next@vger.kernel.org
From:   "Aithal, Srikanth" <sraithal@amd.com>
Subject: next-20230803: boot hang with serial console enabled
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::21) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|BY5PR12MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: 9543a80c-b0bc-442a-d3e3-08db9412b27c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T9WRIArnkAVaQ4r7a6U7HrDEUzKdV7nzO4FrvFjOAJ1kCbT+7g8MzXad7357m7nGp6H8caFfGZ5ywiUXJQwjv2zwW6lbutYUwJ6lXkI0HBmKOKFaooADlCRpPmKXG2HigrOXa0b0Z5mkDLX90IQTtqx+4wmrRdiMlK06VRITtB244oyQzQ4OeKYlNvEyYMiRQR2gdysx7NT3VawTUGVeCmsiNS9OC83ROQ7M2uZXW2uJkHj5nCmpJivr3A+ZShegUrOvbmbX9/UdyyQt4NpAm9s1pRV/yxd0D3O5XDpVlNMQprowvwjs8Ad3JVrxHFqg0Dh7mJK0k7dee/kzUZwMbzwRXMAsik1R/y4WIGKchXo3VmaHSNsCciFFsJayE/f1r/RqL0jeWoGZF0gmXDV1Ss99nFCceAcH2yBKbBxi7lUSKtVJt22uLNsvAfkaEdTyLF4zktq0AQGQNYm5oq5JDvHUvnnui/U1mhif9dsEVrCiyzX2/dkltG+cxlip3D3qL4nrTgBO1yTg9n8dn3BbnT+PN9MDiQxUJBCxw4UYyLQFAGfaIidHirvQWg9t4fn1H/xeOPKguF/LPs3rUdghmXUf6fS0uvJHIZAdsow+A5995+UFRyhDymdNdDp1TbcXSxn7FGPWd8NCYDUhMqYPIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(2616005)(6506007)(83380400001)(26005)(186003)(316002)(2906002)(66946007)(66476007)(66556008)(5660300002)(6916009)(41300700001)(8676002)(8936002)(6486002)(6666004)(6512007)(478600001)(38100700002)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnJOMFJ5SnEvNWpDb0I1NDVBN3V3Ty96ekg0dGtucWFDWE9rTW1tb2xYOFBL?=
 =?utf-8?B?djFhbzc4Szdva2JpRnozQ3BvUFlLR1RxWUlic3duakFrWGZKOHF5c0xxeWNN?=
 =?utf-8?B?cWRlR2dVZVFDaUU2bkU5RjJrMFYxYkFXYUpwWW5vYnNwNE1Vb0NHa2ZmZk4w?=
 =?utf-8?B?Y3FtR1hlSzZadmppT3lYZXZZbnBMTkY0L2ZyUU52ek1FV0FUMmNpUGpLcmlO?=
 =?utf-8?B?RmtOV20rL2Nua0xDRXJFT3h2SUN2S2VKWk5ZKzRyRUJBK0NmVkZKRHZnelNz?=
 =?utf-8?B?dTdweklKc1RqWVRnMjlVVlptVGNnTE0zek5TUmxxaTIwTi8yeS91SHpKS3Jm?=
 =?utf-8?B?ZXJyWmp4N1p2ZzdVczNDZU9Rb3ErUHpxRkNxRFVRenJyNWRJcENTOG1RdTJD?=
 =?utf-8?B?M2p1a1dSdnFrWWFxQkt6RlhGU3VQeUZPM0pOa3kyOC9mZFlCdWdmQi9zVGlp?=
 =?utf-8?B?djhidFFBaWd1MGdLMkZVb1hsOE12emk3QVA5VForNGJJM1pCbk44Unl1VXhx?=
 =?utf-8?B?R0VwbGFsY2lvS1E2QnV1TlpLOWNDc1g3YjUzV3JBSDJiem1iTFFnUUhTQnBX?=
 =?utf-8?B?NHYxM1hXZlZwWmxrNkFUTmtlTC92dXVmaWNkL1p5aE5RemFMb3R3bkplSVRK?=
 =?utf-8?B?QjZNUm42TVZvYVMyZlZ1NUE5NHhyVEZGQVBzdmwxWTdGcFUzQzErQXQwVlND?=
 =?utf-8?B?R1MrUVg5UkZXeGxKRlJqazNHMEI4b28vbkp2ZUNhTjJOMkJtQ3VJYWtGOGVN?=
 =?utf-8?B?UnlBdnd0NENERG9NalErTUlGc3ZrL2lRcFBaVDhFMmJPeWMzYWZ4WHJjTEZP?=
 =?utf-8?B?VXZLZkpLVm5qRm9QQytLS2tRYWd5RnJNNEg5WnBpSVZXZzA2VWZ1UlBVMHcy?=
 =?utf-8?B?WE1LWmFROEFINTVabmV6QnZhUGpqekNrTjJsbDNLbmRSc2R6MTZLSmNwUmUr?=
 =?utf-8?B?SEVIWHVjc1I4YmEvYUg5SDluUDFTcWMwSkdBOFRNcVErOVE3RHU4UitkalNi?=
 =?utf-8?B?VGNoaXM4N2RaQXRPOHZkc3c2NE5sdTJYeHM0dWsrRUJqYVNxdG5uREJKSWY4?=
 =?utf-8?B?MU1jaXFYd3VlMlB1NkU2YWdxc3ZFUEorTTdoWTJsUml1aEQ1VmxZS2x2ZjZG?=
 =?utf-8?B?cGFhQURRK3RsSXhweU9aNVZXcXBUbzJvR0FucWlUK3lxcitWRlZIYjB3Nk9r?=
 =?utf-8?B?RHdhd3Q2NEpFVk4wTTAwdlRkZTBWZnJyRG5SZ29XUkRKN3dwK25BMUg3NWhT?=
 =?utf-8?B?NWhrV3JVOUllNC80REpmVytVWjVzOHQ4emNLcmg1dEt5UmxWL2xveWtXU2Nv?=
 =?utf-8?B?NmRpNDR4WW5qWlVjdFRSK2k5akl5bWgraFhWYXVHQjMramV1R3c0eE5yV0px?=
 =?utf-8?B?cDNhZTRsNGhYRTUrVEc5N0JNbDE3UDZmNlVSOUZ3QkhOdzRtYTBuWFZjUUpE?=
 =?utf-8?B?UmdIUEcyeUtMcmNZOTVBUGEzQWIyb3h1M05PSXVmRVJkVk56SU1DMUtaaFAz?=
 =?utf-8?B?c2g0NXlqUUNMNzJuRTFMVDQwZEVHeDFWeXpnRnFyWkh4T2JGeXZuZzBCTG4x?=
 =?utf-8?B?NEVmRGhCOEpjTU5MRURzL3d0Zi9qSElZdzVkcUllaEJTNktudEhvNW5PK043?=
 =?utf-8?B?eDBRWVVSUVVkRmlCdnU3VG9qV0dwNEIxRG8xeHJxVHgyRE9mck1YSldoQjJR?=
 =?utf-8?B?R0JqUVFTWFIxQlpDbnBJRUJoWFlRYlBTdjI4OTUxVjF2YW42YWxNcEMrR1ky?=
 =?utf-8?B?QnBycDM5NnIwZE1pYkRvamM3K2YydWtFRi8weHF0Rk1RTWpiMVN4TnJXWC9P?=
 =?utf-8?B?Q0hhbTRJOHhyU1FwZHlKT2lLa2RIRWRJMERNUytNcjlMRkhDWDUzaUl1M3lo?=
 =?utf-8?B?VHRsWHg2bkFLb1o0QVlZNW1KcExMeTV0SEJzRHpKVys4WnBEdzNFRllERHJD?=
 =?utf-8?B?cmNZVGdZQytXSFR5SUJhVzhYWkpqNHBLcmg4RVFyMHlqZmREZGZzbCs2aWh2?=
 =?utf-8?B?RmZYN3daMG9qZXVYbUV2ek1KRlpuVlpOOFNLd29rT0ZJM2lGTUpDdHlHcGQx?=
 =?utf-8?B?TUlxNk9NbkFZY1kwYzl3YVRpbzFOM0pNL2I3c1hXTkdWeGdHVkFlNEdLWnEw?=
 =?utf-8?Q?ceVhTmhCcHaHuLYCvGFcNyUeA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9543a80c-b0bc-442a-d3e3-08db9412b27c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 11:13:43.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9tgBPaH/TMEvnplQZKEx4amrhFAMKrCPrcBUJB68uc0f5WyGCjo+UCoKkx25ZSqkomlfQIANIY/RXU2dP6Xjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5013
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello all,

linux-next build 20230802 onwards seeing host hang issue when booting 
with serial console enabled.



===============
Recreation steps
===============
1. Enable serial console by appending following parameters in grub:

GRUB_CMDLINE_LINUX append with "console=ttyS0,115200n8 earlyprintk"
GRUB_TERMINAL_OUTPUT="console serial"
Update grub.

2. Then try to boot into next-20230802/next-20230803


Below is the error seeing when the host kernel boots and then host hangs.

Memory KASLR using RDRAND RDTSC...
Poking KASLR using RDRAND RDTSC...
[    0.004421] __common_interrupt: 96.55 No irq handler for vector
[    2.552117] pstore: zlib_inflate() failed, ret = -5!
[    2.564770] pstore: zlib_inflate() failed, ret = -5!
[    2.577606] pstore: zlib_inflate() failed, ret = -5!
[    2.590765] pstore: zlib_inflate() failed, ret = -5!
[    2.606677] pstore: zlib_inflate() failed, ret = -5!
[    2.635828] pstore: zlib_inflate() failed, ret = -5!
[    2.650669] pstore: zlib_inflate() failed, ret = -5!
[    2.666176] pstore: zlib_inflate() failed, ret = -5!
[    2.682027] pstore: zlib_inflate() failed, ret = -5!
[    2.714415] pstore: zlib_inflate() failed, ret = -5!
[    2.737626] pstore: zlib_inflate() failed, ret = -5!
[    2.768368] pstore: zlib_inflate() failed, ret = -5!
[    2.802555] pstore: zlib_inflate() failed, ret = -5!
[    2.828769] pstore: zlib_inflate() failed, ret = -5!
[    2.849776] pstore: zlib_inflate() failed, ret = -5!
[    2.870973] pstore: zlib_inflate() failed, ret = -5!
[    2.893790] pstore: zlib_inflate() failed, ret = -5!
[    2.913867] pstore: zlib_inflate() failed, ret = -5!

