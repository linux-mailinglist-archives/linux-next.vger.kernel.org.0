Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E990D50A7DC
	for <lists+linux-next@lfdr.de>; Thu, 21 Apr 2022 20:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243787AbiDUSNc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Apr 2022 14:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiDUSNb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2022 14:13:31 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A56A4AE2C
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 11:10:40 -0700 (PDT)
Received: from [192.168.1.107] ([37.4.249.94]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M1pk0-1njn2M0Qm0-002H3L; Thu, 21 Apr 2022 20:05:10 +0200
Message-ID: <7be89f17-8993-c0e9-3965-4ca5db3c4b57@i2se.com>
Date:   Thu, 21 Apr 2022 20:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: linux-next: build warning after merge of the pinctrl tree
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220421171116.6dbe87cb@canb.auug.org.au>
 <CACRpkdYW81iLveJoNu2RDEpySqRcXWqq4XGhGFMYdLvBzhRsUw@mail.gmail.com>
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <CACRpkdYW81iLveJoNu2RDEpySqRcXWqq4XGhGFMYdLvBzhRsUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:EVtiik8/dSmwP3H2lw0tuXN//9pN2Fsr+moOQlE9wMzlbK6EuzT
 9nf5OwVSCP1J8JA9lr/Rc0Ln8/3HFyIWJK3NooRSblS+uWSg8LQ/6N1hqvu34QkLEb2FFFf
 mGOhGK9Cwnt0nzJ8OAxXqpgAoBQ9g8GkdkgvBRy2xzYzf/gXYoPZIZFg3DHGkUTRUT/6yGJ
 bcWWcwhUydvEgi3qc3IQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7QmUpVDjjGw=:Vh6onroOFiDsphk5KR9E97
 NLpOH56MSYxn+ebdi6kB+FzDFLwaRpuuk1IrPmL0yCmaKx9TWE2W6qmZV1miJNQU0dJ6TroNs
 IgIGPIr+WU+depqAUefAKdzDrW2qR0AAZLxjZUChbwXDw2Y7bDEp77iCD0lOg5Z3y9vCtd/jg
 pivnfEL4y7pBsCEjIaVZXS8NFeFcSm+UY7VGjKbmDSSY9NVOkmtwvE27n31FO745YO2Cy99cH
 p9f5FIA9+fnCDLLK6tZGJxKB9JMWAeIPKDFF0CkhRFvpwq0CojjIkaUtY2MwRWKuoNIKz+ZIx
 w+yU14aeZCcvLMRmzUBosFI8a9+dWpDzA4yIUUbi4BGUQk5a0KUqlZMtGiiG2T3zE6v2JsyFa
 DAUM/sCYD0Y8yk8UhQkXGSXsU24AHxTVtmzG52TGWkdvFLGtzGAFmKdcgWn/1dDXMqoDD60ba
 k7lMWCh1giRfNe9L8V1haDFiNqUyPgMn3cXp7a9kveKJgsm50vOA3CyJTMly70iUdFBUvX/bN
 wZFUAdUeyMaMJMu6eCT9NnMno+2wFVDOMQbXbWOlMvMJEewfP/DYAAEZZx3/0l96hBwMKQ5eC
 5XV8/z1QpfbxTeyU8J7RMX8zqoMwv3fUzZqxADrtJF8iXZhp5V3C4/spT3s8Mm9P8gSIQFIUr
 sJAB0uryx72bzjGzkZQxhauGQbehUa0qEDnzWXjBxxaMEdNVIYHnKY7JkbcgM8H9tTSyJ6W2c
 OI9WQwhwQk6t/3ua
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Am 21.04.22 um 16:12 schrieb Linus Walleij:
> On Thu, Apr 21, 2022 at 9:11 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> After merging the pinctrl tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> include/linux/gpio/driver.h:507: warning: Incorrect use of kernel-doc format:          * @of_gpio_ranges_fallback
>> include/linux/gpio/driver.h:518: warning: Function parameter or member 'of_gpio_ranges_fallback' not described in 'gpio_chip'
>>
>> Introduced by commit
>>
>>    a9491df0c4ae ("gpiolib: of: Introduce hook for missing gpio-ranges")
> Thanks, I just folded in a quick fix into the offending commit, a
> single missing colon.
Thanks
>
> Yours,
> Linus Walleij
