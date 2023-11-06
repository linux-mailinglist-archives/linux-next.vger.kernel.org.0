Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6D27E2109
	for <lists+linux-next@lfdr.de>; Mon,  6 Nov 2023 13:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjKFMNt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Nov 2023 07:13:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjKFMNs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Nov 2023 07:13:48 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEC292
        for <linux-next@vger.kernel.org>; Mon,  6 Nov 2023 04:13:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bf3X95sufPh95JN9hxdW4QcCn7/psJFH9AeRpEzwXz0p6BCHlSIpADNKJ3zkHABL/gIcsF5S2dxyJoBCiIw4gtTlhjT7AyI27IxWSGQI7ENW/ps2KySKotFGy3CUO5cnL7u/qVFelkqq6rsMw7og7lg7oSsqP9qiVEZL0JH+eW5+6Yq9HQTGdl6p0IH5Ntmhg4TdmZ1Us1qDxwPC90mULKHZW9x8RIceYgRkUp49UnMeTGMl8XV26VpeSt2ox2ZLNiZFkxfMdC/Gsio5tpuh98f8e2MiAMm88E27hWqa5uro7oUqe8hADQxLzebbByJ/XX6cu769/m5M3aH39OpKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH41wcuX163cCxxteZe/+NDk5u0vlZDnNVEgUruVoGU=;
 b=neUswETKPj48eINpShfYNOWld+0r+XcWzZ8PmoEYG+yMYXvZq28IkKQpK+eBvF/GH/EPs9YAtZbH3KOm0Dni8dJJ5haVvgiHUmGa+sqAew+BqGSulVmNLMwf3AId58pYXcvBO9WMQ1Bd6nNZqv8oBT3eZyp/Y85l9R0j3Fmxc1SEv4l3GFRG9P2zOwiu3Jt97WKrrzuyi10+YUBp7lw/I0YAdhhf0mX19lMVmKGTN0rbsVXOqbIF+63ZEd9QBRPQE1Ua9+cW4ktHAxvg0GqFEJX5p2DYoHnPZc2yoM3of0gg3+Gzliebb1po6jFyJioGUZQyCrfxkUSJPaCgWiGGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH41wcuX163cCxxteZe/+NDk5u0vlZDnNVEgUruVoGU=;
 b=mDnOI7dkFa2YIbA0hYP9yy+MSoKK3fiS40aNWDI4T+4xSCOipw7EhVxT+vq/OjEhO5vao9kygtuUBP7hePuf2+J2WxDhzmilRJnh9Yimfm57U4XoQwaDyDlQLA47uO2XkDpMExVy6lsZ63bd8sHfNsMTvy8jN5vrokCnPIFnCcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 LV3PR12MB9411.namprd12.prod.outlook.com (2603:10b6:408:215::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Mon, 6 Nov
 2023 12:13:43 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 12:13:43 +0000
Message-ID: <e67d3918-f52c-4058-bce8-114ec685168f@amd.com>
Date:   Mon, 6 Nov 2023 07:13:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Fix stack size issue on DML2
To:     Guenter Roeck <linux@roeck-us.net>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Roman Li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
        linux-next@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        Chaitanya Dhere <chaitanya.dhere@amd.com>
References: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com>
 <20231016142031.241912-3-Rodrigo.Siqueira@amd.com>
 <aa6344f8-abd4-4f9e-86cf-febecd6fd747@roeck-us.net>
Content-Language: en-US
From:   Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <aa6344f8-abd4-4f9e-86cf-febecd6fd747@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0260.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::29) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|LV3PR12MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: e05e734f-060b-419d-e919-08dbdec1d1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iKkbQ1fc3DNLmFJxkly22yy064N1rjLXnhRsjGhnr4NO0NJ+kRtfzoNfhPJ6wrONUiHbFGO942dAWLVXhaCwp28C08Z0uSu6W/p/l8VB2gUO93TdpyWurGic6u3wDruI619UV4d6MTOiV37zpni6PulOkFn91JJvFE75DVhRIitcAqBf7PnkaNRQ1aN7YdjcjG5SvoD1RwJb9EUTrpu+s3amJZ0gm5Jj7bgcLk+izJ4szYq/MPKmVkp7dctjWC8ALsOfzTBNgJ07tnuKje7+YCN7ji8GcK1PT3oxeFPAO4eeLxn1kFqi2TfHsiMBmp42tS2IfLuZMkbPT+EilbHxK+L3Q/O/MsJtDQe4dxkF1qlyy76gLcLh3fRo1yzpJkDoE6eHOY2ZoqhlPthjMsPqZzroCeiva8HWM+J1S/1WmX/qL6bxt0T0KtW2sPSTrOfnXEtfeDNfDx6HRZRgaugSnFPc2cHP7mW4RLumO9RkkJS23pdHCqNQDB4RH+S0xOvnIPjQrNUe6WhD7Dk3yjaRuf7NJOlglj1S4oPDgp/RFBJeFCXzqnQBlXEh/PqZ1YP8GIrs1b64xYQ5GptgPkjI9rNI6V0wf5M+9uYDiHyXTb5/9VTXXAD3S6lYqrLle7Kn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6280.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6486002)(2906002)(36756003)(26005)(2616005)(6506007)(6666004)(478600001)(4326008)(54906003)(66556008)(66946007)(44832011)(41300700001)(110136005)(66476007)(8936002)(6636002)(966005)(8676002)(316002)(38100700002)(86362001)(31696002)(6512007)(53546011)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3ZHSExGTUxZM3NxMDdEamZPc0pjcjh1NTBVS0sxdkxBR1dZdEhRN1BiTVB6?=
 =?utf-8?B?RlFCcUJONUpQcU5PWmw0dUNCbldDUUNKZGJqTU1kWFdzUG0wbzk5V0Q4bUR2?=
 =?utf-8?B?cDVRUzIxV1BpTU5mWmdMM3lkdTlzVHRHSEg5dXlOUHdvWUNjdjZDclkwS1dk?=
 =?utf-8?B?VEltVFJyNUxsNGR5ckJ6WDFFQTdybmpJQlBRaHVZZmZxNEh0ZlRVQ3hKTEFV?=
 =?utf-8?B?R3k2d0hheGY1WVozbTRWaFdnQ2VxbE92ckdscTlqUFFwWHhhUVJScUhaTy9q?=
 =?utf-8?B?dndUa0I4d2FVanBpRWR4YjlkckZXSHZyRTBrUUVuSXgzbUkrclcxc1VDVzdZ?=
 =?utf-8?B?Wm56RGpjakh1aWFoeHhZbTJ5ZlE4cGJyZTEvQ1ZzK2c2Nkk0bStxVWlSR1Mv?=
 =?utf-8?B?RDV5eFZxSURpd0RQNmxlaDdaWThmdGhNYmxtd2xtSXBmbE1ORitWbVlDa1lS?=
 =?utf-8?B?UzVCd2kyTkZYaFpvbVNTUTNoR2J6ekpPcmhYckhnWVpUclZmUDdIU01ZM3F2?=
 =?utf-8?B?T2RaOUpNcGpBcHd1bmdWWjI2TGJnUGV2RXdMY0FJdXJobVhyaTZISVhRR3lS?=
 =?utf-8?B?Ty9abFV6UTExZXMyUXFyQk4wSEZUUkFJeTBReThvaVlkOUpPWGkwTjNsc3g0?=
 =?utf-8?B?Nm5SNVg3R3lGVFJsaEhUTnZpOHVOa245TFNBbDVtclhGNmMvK1lSSW83Qkgx?=
 =?utf-8?B?a1FPd3I4dVpNSlJ5YVFBWnViUkxCVUJ3aHlpRmRxMitKMGFLQXVaQXFPdlJS?=
 =?utf-8?B?U085RlY2b2VXRFpES21YTlZVN1ZJVWl2Ukc0bzJZZ2ZKcWEzUm80b3ZqOXpQ?=
 =?utf-8?B?SldFNUNYbkFoWFY4SDhLb0p2SWNBaXRhYzdpTkhXZTVYdlE2aHUxSkRaaTNW?=
 =?utf-8?B?UlBwTDNwNzlTdmhVeTAyWUsxKyszTW8vRGJYa0I4b2tqeWFVNm9aL3NXV0JI?=
 =?utf-8?B?Qk9IVDlTU2pBdGtwU3ZwVDIvbys0REJjTWV1YTBkNEdya0syaC84TXIxY3lE?=
 =?utf-8?B?ZC8rZjFxWW9iczVWTGZyTVFnemR3VURRSDEvQk5qNkFVZG5Wb090blpaMHVL?=
 =?utf-8?B?TlN4QVRaL1U3SUNGREdzVFRTbmNHT2M1b2lLdWwxNDFiNTVtbUJqbGE1OU1s?=
 =?utf-8?B?enJHTVhPd2tyQXZ4V3ptWjlSV3Exa1RDM3pmMCtCZUJKU0gyUFFmQVBtT1dw?=
 =?utf-8?B?Y3VvNDZOLzlHbE5GQWlha2h6YS9qd09RT1VONStMcWhlRWJSSWNJY25VK3ds?=
 =?utf-8?B?bkRNb1QyZkZKaEpVWEJ4MWFKMTBOM1NHQmhVdE1WSEpjWUIwcDgxL0paVUs2?=
 =?utf-8?B?SUxRazNVVWtNZFJMeUE4Tjg2YjcveDVtR3VYd1FiMzBNWWFiN1pPa0dySUdE?=
 =?utf-8?B?by9RSVlsYnBuNE9QbkNEeWRKVWFDYVlQWGliNEZFdmNwZ08zTkIvaUxIYndj?=
 =?utf-8?B?QUtYdUo0Ly9mdHpJWUdlVGR2NEhLUDBnSW1HUDlJaG9SRUxMdnFnb0JWeGxE?=
 =?utf-8?B?eFpuWmpiMnh1N2FnallXME9ZRkpwY2hMNkZqNUYyL2ZucTdPVG93djVXMEQ1?=
 =?utf-8?B?YXF3ZzBDc3dqT3pHOVlpdU9wMXo0RnIxMjlRUlgrSURPekpSRTF2R2J4S1k0?=
 =?utf-8?B?UnB5YUhiUGJHWE1XclQ3UnNJOWtHV1hvcmsyNWs0U21KMDV6ZXhCRUV4TWdl?=
 =?utf-8?B?UzVNZndTYjNBY1ZTRWxQSDIvNG42QkFrWC9tT2dpdXRpVTZFd0FVWTZRc2VS?=
 =?utf-8?B?UGpOU1JmNndpdU0ydXlVeFVvTzZQV016U094LzVhZkJpOGgrZ0hKelpBSnNE?=
 =?utf-8?B?ZjllcElac091MlhpTndkWUt5Z1dxbTBpdTYxTFN5clpYRm03cklKcGtlQmtS?=
 =?utf-8?B?V0h6YnZMYm82bXpKQkxxcjFwb0FadDcyUjJBbS80ZkczUzNndHVBN0hQVFo3?=
 =?utf-8?B?dEZmV3pwaUE1NlNMSHNCb2liejdKWGtNQlkwcVpZeDhaUDZxQXdyRVZuNkRz?=
 =?utf-8?B?ai9RdTI5bGwzQ1pnNTJqVlpOSHhPRm9aWTVyeGxiVGd5aUVVWkZHdnpDd2hn?=
 =?utf-8?B?QlhRc2lCcVJzYXpCRU9tRHJxTHgrdUI2K3VkbmJkYXZJMStuWDZ4cSszaUd6?=
 =?utf-8?Q?yKwAnMA/uu5uj1uC5lqHprbh1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05e734f-060b-419d-e919-08dbdec1d1cf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 12:13:43.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQ2zXpikPVRboWvwmd88qqfhIMwqMx5ZGEj3aNnlsSpND29n7aCKz1EcnS1zbiUkZ1A9NBKxNtcyukbQm42CZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9411
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/5/23 12:55, Guenter Roeck wrote:
> On Mon, Oct 16, 2023 at 08:19:18AM -0600, Rodrigo Siqueira wrote:
>> This commit is the last part of the fix that reduces the stack size in
>> the DML2 code.
>>
> 
> That does not really help when trying to build allmodconfig or allyesconfig
> with gcc 11.4 or 12.3.
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6707:1: error: the frame size of 2056 bytes is larger than 2048 bytes
> 
> This is with v6.6-14500-g1c41041124bd.
> 
> I am overwriting it by forcing CONFIG_FRAME_WARN=0 in my test builds for
> x86_64, but of course that affects all code. Maybe consider increasing
> frame-larger-than in drivers/gpu/drm/amd/display/dc/dml2/Makefile ?

That has been done as of the following patch:
https://patchwork.freedesktop.org/patch/565675/

> Currently it is
> 
> ifneq ($(CONFIG_FRAME_WARN),0)
> frame_warn_flag := -Wframe-larger-than=2048
> endif
> 
> Guenter
-- 
Hamza

