Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6212A3C77EC
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 22:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234665AbhGMU0s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 16:26:48 -0400
Received: from mail-am6eur05on2106.outbound.protection.outlook.com ([40.107.22.106]:35552
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231499AbhGMU0s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jul 2021 16:26:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPxDDQheUIalxo3VTwQXHc3lbiweVOhBzDF+CeUM5AWEJMSOzzBMam8jYoPf9xu/gvEDG8JsdQtj8cr7MEhcW3OmtdBV+LdYgL6N+siM9LyzpZw5+kkFz8hUw/mjbj/L6tGIk/hMlgMUz8Jdco8wHqKo7Jr+dgi8lMTsbUNULjGI4kKuknO+A3xsmqG3MEIg7/JddtESPTeuEj2XkVoqD8JwxM3ox/M+lCq3orJps1flXbJmHtucAcCdB3ryePDUqtUUKrk57kit4ceHo1q2RulEDwuRedW7XmBDuZfDtjLACsxqpZy3pkL5yrq7xbibkEAJ4/oIhATRIfdDrQErGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYr7u8cZxTvFvwn/gFMC5aF517mLdMmSnAaRuwylQmA=;
 b=IKKlGMuVYPtIVwv6yotX4EgBwg4tFae5dgJ0YNSVvm9ObNdql8z5OmiLNO/00u4YBw2AE0yqJZcDTdrJjbcAmLwj+C5BcQwobintmehy/syqLVIy7lEin634Y4oICloQxVNNFTlojurcPiq+pqVc/zALOSLi38MxJ2Ffl045YJoRBHxBawpb7ehdv9HOeefaFZSEQa0a9ctbyz9iVcZBMyq5WKSpwpA9GYBqRlJJAddWZtNEjaLBNAewxFP7mLTh1BPdVyp3G7JVRfBFbFAR4IX5P/PmDLmby7Rq9f+Ym1jJFimdcFzCd/etu5WhryZLJoBoOhRZYGkla3QvD7TfaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYr7u8cZxTvFvwn/gFMC5aF517mLdMmSnAaRuwylQmA=;
 b=BODSMHrwYWevnskDHM1edUuV8xtF23N46Fr9ChO1Ce8r/RF/xvTdnphJxo2VciWhWpgzrMfqGGkogkmHN0Jjlk8l/D8RSZWDHQRi6U/myIv47gC03WvEyrB/Sh1ty11FfYLReOzhm2EbF+soCtQjOk58uIoY1ndM16u1t2Lf4HQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=toradex.com;
Received: from PAXPR05MB8285.eurprd05.prod.outlook.com (2603:10a6:102:dd::24)
 by PR3PR05MB6956.eurprd05.prod.outlook.com (2603:10a6:102:60::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 20:23:55 +0000
Received: from PAXPR05MB8285.eurprd05.prod.outlook.com
 ([fe80::68c9:eb5c:2e08:f814]) by PAXPR05MB8285.eurprd05.prod.outlook.com
 ([fe80::68c9:eb5c:2e08:f814%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 20:23:55 +0000
X-Gm-Message-State: AOAM532Ou5R8P3BMmJ/unYN4CSazXQt2Jtw0rML7S2xSnhpIyNHjYSxu
        EOGhN3mhd2bhZOWsE7AGL+pxT3qGbfZpDs+qaSg=
X-Google-Smtp-Source: ABdhPJx/v+O2EdRYJJ3oMVbZxseQmBEo/taSLRvt4Ud8xAo9uX1H/14oHhhJibQm7sCjcC53RJbfsg7U4jh6t8/jpVk=
X-Received: by 2002:a17:906:2287:: with SMTP id p7mr7910388eja.181.1626207834201;
 Tue, 13 Jul 2021 13:23:54 -0700 (PDT)
References: <20210713195416.277153-1-oleksandr.suvorov@toradex.com> <CAOMZO5D+4Dg1q+fxM7Dfz_y1f1wpE=kZx7ew+bdkBiQdWB7YCA@mail.gmail.com>
In-Reply-To: <CAOMZO5D+4Dg1q+fxM7Dfz_y1f1wpE=kZx7ew+bdkBiQdWB7YCA@mail.gmail.com>
From:   Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Date:   Tue, 13 Jul 2021 23:23:42 +0300
X-Gmail-Original-Message-ID: <CAGgjyvEQTCBNBP3LTsOHzTMBHMbw_y426JBMq-VZb=jXSUDsTQ@mail.gmail.com>
Message-ID: <CAGgjyvEQTCBNBP3LTsOHzTMBHMbw_y426JBMq-VZb=jXSUDsTQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM4PR0501CA0062.eurprd05.prod.outlook.com
 (2603:10a6:200:68::30) To PAXPR05MB8285.eurprd05.prod.outlook.com
 (2603:10a6:102:dd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-ej1-f53.google.com (209.85.218.53) by AM4PR0501CA0062.eurprd05.prod.outlook.com (2603:10a6:200:68::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 13 Jul 2021 20:23:55 +0000
Received: by mail-ej1-f53.google.com with SMTP id hc15so5260973ejc.4;        Tue, 13 Jul 2021 13:23:55 -0700 (PDT)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58701fb7-2a81-433d-0448-08d9463c2318
X-MS-TrafficTypeDiagnostic: PR3PR05MB6956:
X-Microsoft-Antispam-PRVS: <PR3PR05MB6956075D2253C9870AF2FF25F9149@PR3PR05MB6956.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UaIbcTQcXKA1eqtHfqhvEgNYQgPyEiURRc2/15Z4im0zmrQN4Ov0VbiUaTwCuBYFaolE6I5aYNOTV3NISx5E01fZNP9wJpWmaok8g4z4a0RcGAmd51sUwKwbejH3Ocs/Pph/Q2bTnw1qUN0hLsYHo5ThwTBzqei6mE8eXxoQtoD2/wKGng8KBIcMl1WezxI8UlWfx0sWS2cpTr5/G/GvoNtrIu39YpfT5pP53YkLeLJh1X2JHGIauHW1y2QzalbNStDG/62qJpQHpW6OeRpsNNMs9a11s7a5FvVr5Xud+zNjcWB0fZKTEn7t0of9kos8U1eI0ZFynR5A4ey7M/ZevoA/qlGR+H/EldPxITon7QR1rnpL1QC59olTE1jtIXNpVrJmoBgKKwywpGn7mUO9lOdBNn/on3CEJy6fBAcOx1Bg5M5wdDeYMADLUEwvRFh1Ecu8waSVv1ceeN13JqF7zeqwc+/zLbbgnX1a7B8Kdi0OY2IbRPqxV5jx17lmn5E6YHV8Ci1HIHS+H1vaX7n2cYwnnraZBBE0btOhLrI5Lin1S8HDFvqwSRCTtpDJ75FhUpTn/vbDKD9Tda4zdFPaNdTpLRFlQEqZHJSFyrnk23t1bWEbzU9ocozn1CT+JIIZ5afzyIGTJ4Tn6rIDS+4scywBaRaPPPnw4+iCULk/RzmsdfMrHpkyTZ2tK3jaCjnk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR05MB8285.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39830400003)(136003)(346002)(366004)(396003)(26005)(4326008)(54906003)(478600001)(8936002)(86362001)(186003)(42186006)(52116002)(450100002)(44832011)(316002)(9686003)(38350700002)(4744005)(5660300002)(8676002)(53546011)(66556008)(6862004)(38100700002)(66476007)(66946007)(2906002)(55446002)(83380400001)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHRJOVpCMDViKytSZXJSMG12VUUwN3l5TzA4NTRMZm9xcXdPcVFneUhGdk5s?=
 =?utf-8?B?UVl6bGxEYlNMTDNldk9ZYXVVUXVVTmQ4WnE0Zmd4MjlSNjZ1cFl1S2RGQjly?=
 =?utf-8?B?UGNtNDdyRG93alRlZjdQdUZuOXlIeHowS0t5MUpzRDI0ZXc4NTQrUTBBZDZv?=
 =?utf-8?B?cXJKN2ltaUFRUDdRczBLQmhFYTdQN1FZQkdUOE5VMHVRa1paSTcwd29pTjlu?=
 =?utf-8?B?R0NDbGtMdVcveS8wZ0Q1MWFYRDBUNUxvQXFJNU9zRS82cGZIMktIS0k0ejhw?=
 =?utf-8?B?bHlRMUZpd1N6cVFlZVgyVjBmbCt2dzhabHVTZzNlK1N4U0VQMDBlU0piaVIv?=
 =?utf-8?B?MFdOOGpDUnpyd0ppSkNlWTdLclNlMnNCSHlML3pwMjJJZm5kUFN0R0wrd29T?=
 =?utf-8?B?UHdwS1RMWnArdGpKTmVZTDRoanM0YXBTRFNiclBwdWRqcUY1NnJMd2RCbnBM?=
 =?utf-8?B?UUVOcmdTc0FSaTVBQy81QWdkRW55bVA3NjBnQUhVT3VDU3huazJBZ1RNMHJx?=
 =?utf-8?B?WTFYSjlXdDdncyt6UFlvbVdTWmd5SDB2R09JRitGNkVhdHNzMW92V0RaWVJj?=
 =?utf-8?B?K3oycm5HMm1wTFVZdmdMcUsvVmVzVU9jbFk4OTY2cnRGWC9KSHJzNHREbTFQ?=
 =?utf-8?B?Sks1Q0Fsd1ZEbUhTL3A0QzhwZXoyaXNMbE9zbHh4NVBaWUVsQVZlb1ZOeHZp?=
 =?utf-8?B?L0NpYXUyWE5OUDFBVmlCbkt0cGQzNFNSUFNoZk12bzh2ZndhQWxHNm1QUlkx?=
 =?utf-8?B?N1VSVWdKOFpSU1lpbTZ1cnVSejREdVdvTWFsSnRDT0ZkTCtoSzVzQS9Jdksx?=
 =?utf-8?B?L01TSXFEbEIrajRtR3dwN3dId0hCYi8xM3g5aGIrbDdLTGg0blF4SjdTMVVR?=
 =?utf-8?B?Q3FUbkFmVnJ4dkdyRC9jb1gwZzNZeHJBUWJ0YnRjRGt0UmEzVEFHeWp3RWJX?=
 =?utf-8?B?dkZRSEt6OTFGd3grNW04VmFldk04NVVlaHM5SG9TU0M0em8zLzJUTVEveEEz?=
 =?utf-8?B?Z3NHL1FWR0RxcUU5dzNhVXhickkxT28rV2Zud3NPajh1TnJQOVoyVUxVK2Z6?=
 =?utf-8?B?dGZSamZ1ZXpBL3g5UFAwVWFnb3RQQUk1Mk9XSC80M2FyeUZsNmtzdzBvZ0pZ?=
 =?utf-8?B?amlXZmZaSlpmdS91S0ZUMnEzUFFuZStZNEF5WEIvajFoZnJMSks2Nlo3ZkRV?=
 =?utf-8?B?a293Qk1oQ1lYL0c3RTFVdnZ5QU12aVhjOW94c1hlbWpwVWh5YUE0TjFLUzVv?=
 =?utf-8?B?aDNYeWdMdnQ3MjhZUkZZOTZNaVF6L0RtdS9uREljV3ZIdWZrbmRSYmQxZG5B?=
 =?utf-8?B?RXdvUWhudHJ1bXV5QWwzSjM1LzdVMzg2aTZabGpoK1QrdS9hM1pkODBxMFFm?=
 =?utf-8?B?aUxtRjZaVmROOE9kdEhGcjRObzl3dlRFOHpUUXd5VTk5b1h0M09KMVEvRVFi?=
 =?utf-8?B?cHl0WHRGQXZvTU9XeXpYWk9QN1MvNUdSZUU4and4UjlCRVppQVRVbDQrS1ho?=
 =?utf-8?B?b2ZjSUs4Ylc2eW5TZHl1UC9lK3lNZEMvMjlQZ0xWSzJUa2MyTmdJY3JLKzRS?=
 =?utf-8?B?bzFNZVkycUh0NVFpSnFYYldYeHpSQW91TE82blJ0MGlWYXJUcHFsK2l2b0Fv?=
 =?utf-8?B?VkJIeFZNdXlTTDExZFdjSjc5c2NDSnBPT2ZzRTQvN2dDd3NDRWJ0R1JGY080?=
 =?utf-8?B?SjJVYnp3R3hpY2ZFVzdNM0RkUlVMKzlHNWhlU3JZSjIybTlBejY1UzB5cHBW?=
 =?utf-8?Q?Z25VY8gR/Gc7xdPg2x+VPlUuvdNUAhFu8/QnNnf?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58701fb7-2a81-433d-0448-08d9463c2318
X-MS-Exchange-CrossTenant-AuthSource: PAXPR05MB8285.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 20:23:55.1788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBcQynCEZkMdRhsEXDtlVe7uErRnKdv0LiDWD9PsmRpKG8wIZ7G40K5ijGasl4Tdai0AOZVe3LQ2S2kf4lt/pFWOla/8XqvsgGC8r/H0HWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR05MB6956
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Fabio,
On Tue, Jul 13, 2021 at 11:10 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Oleksandr,
>
> On Tue, Jul 13, 2021 at 4:54 PM Oleksandr Suvorov
> <oleksandr.suvorov@toradex.com> wrote:
> >
> > NXP and AzureWave don't recommend using SDIO bus mode 3.3V@50MHz due
> > to noise affecting the wireless throughput. Colibri iMX6ULL uses only
> > 3.3V signaling for Wi-Fi module AW-CM276NF.
> >
> > Limit the SDIO Clock on Colibri iMX6ULL to 25MHz.
>
> What about adding a Fixes tag so that it can go to the stable trees?

Good point, thanks! I'll add in the 2nd version.
>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks for the review!

Best regards
Oleksandr Suvorov

Toradex AG
Ebenaustrasse 10 | 6048 Horw | Switzerland | T: +41 41 500 48 00
