Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CABD6173BA
	for <lists+linux-next@lfdr.de>; Thu,  3 Nov 2022 02:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiKCB10 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 2 Nov 2022 21:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKCB1Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Nov 2022 21:27:25 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E6D8162F7;
        Wed,  2 Nov 2022 18:27:20 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2A31Q9cC4026884, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2A31Q9cC4026884
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 3 Nov 2022 09:26:09 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Thu, 3 Nov 2022 09:26:45 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 3 Nov 2022 09:26:45 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::add3:284:fd3d:8adb]) by
 RTEXMBS04.realtek.com.tw ([fe80::add3:284:fd3d:8adb%5]) with mapi id
 15.01.2375.007; Thu, 3 Nov 2022 09:26:45 +0800
From:   Ping-Ke Shih <pkshih@realtek.com>
To:     coverity-bot <keescook@chromium.org>,
        Gary Chang <gary.chang@realtek.com>
CC:     Timlee <timlee@realtek.com>, Kalle Valo <kvalo@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: RE: Coverity: rtw89_mac_resize_ple_rx_quota(): Integer handling issues
Thread-Topic: Coverity: rtw89_mac_resize_ple_rx_quota(): Integer handling
 issues
Thread-Index: AQHY7vTK34zqP3ff/Ue2/1FOByxfdK4sZgug
Date:   Thu, 3 Nov 2022 01:26:45 +0000
Message-ID: <884ff1b628e44d32960f438f75a6524c@realtek.com>
References: <202211021253.44E254479@keescook>
In-Reply-To: <202211021253.44E254479@keescook>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/11/2_=3F=3F_11:06:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


> -----Original Message-----
> From: coverity-bot <keescook@chromium.org>
> Sent: Thursday, November 3, 2022 3:53 AM
> To: Gary Chang <gary.chang@realtek.com>
> Cc: Timlee <timlee@realtek.com>; Kalle Valo <kvalo@kernel.org>; Ping-Ke Shih <pkshih@realtek.com>; Gustavo
> A. R. Silva <gustavo@embeddedor.com>; linux-next@vger.kernel.org; linux-hardening@vger.kernel.org
> Subject: Coverity: rtw89_mac_resize_ple_rx_quota(): Integer handling issues
> 
> Hello!
> 
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20221102 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
> 
>   Tue Nov 1 11:26:13 2022 +0200
>     7a68ec3da79e ("wifi: rtw89: add function to adjust and restore PLE quota")
> 
> Coverity reported the following:
> 
> *** CID 1527095:  Integer handling issues  (SIGN_EXTENSION)
> /drivers/net/wireless/realtek/rtw89/mac.c: 1562 in rtw89_mac_resize_ple_rx_quota()
> 1556     		rtw89_err(rtwdev, "[ERR]get_dle_mem_cfg\n");
> 1557     		return -EINVAL;
> 1558     	}
> 1559
> 1560     	min_cfg = cfg->ple_min_qt;
> 1561     	max_cfg = cfg->ple_max_qt;
> vvv     CID 1527095:  Integer handling issues  (SIGN_EXTENSION)
> vvv     Suspicious implicit sign extension: "max_cfg->cma0_dma" with type "u16" (16 bits, unsigned) is
> promoted in "max_cfg->cma0_dma << 16" to type "int" (32 bits, signed), then sign-extended to type "unsigned
> long" (64 bits, unsigned).  If "max_cfg->cma0_dma << 16" is greater than 0x7FFFFFFF, the upper bits of the
> result will all be 1.

Thanks for pointing this. I'll fix it.

Ping-Ke

> 1562     	SET_QUOTA(cma0_dma, PLE, 6);
> 1563     	SET_QUOTA(cma1_dma, PLE, 7);
> 1564
> 1565     	return 0;
> 1566     }
> 1567     #undef SET_QUOTA
> 


