Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75473627AA0
	for <lists+linux-next@lfdr.de>; Mon, 14 Nov 2022 11:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235772AbiKNKg6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Nov 2022 05:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235994AbiKNKgx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Nov 2022 05:36:53 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE091DA5D
        for <linux-next@vger.kernel.org>; Mon, 14 Nov 2022 02:36:52 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o30so7156410wms.2
        for <linux-next@vger.kernel.org>; Mon, 14 Nov 2022 02:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYEO6wqTqv+FmuwBR3/AJzBYR4CPg3qT2Kq0wYLhKiU=;
        b=tZ14j0SiCf8JV93gqVeXeoWfM+JsdMsHV2hntvr+QN2dDMd/uYDN8Wpx/KxozF38wD
         cZ2zf7uJI0snn1TDL51ODIZInsW6uz2FS+6paUlffxk+thi8mXznjk602tO/vhADiDN0
         MRx1Tg678u2DOEmJd8BUEVdBBjSBqvW9Fp0+4SGqjK++QQNLm1nclhETcIit0kUvdPYg
         hu0w61TUI8olMpc0jnrFPaJqeu3CEtn7Z6XvcNME/5/wU/lpw50e+Cih+NRPIZajk/6W
         48iqJDud2eFeYCqWa63NbiTYQ7WVA9G/bVrcg+ZKgas4AHTg4bzu52zPTX1UlxV6hYq9
         h+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYEO6wqTqv+FmuwBR3/AJzBYR4CPg3qT2Kq0wYLhKiU=;
        b=yJs4EepMMXUYEDJFCHFg6Uk8Zy2DUDJjEGn6SeKCnOI4MVyxdDqZbbJh0M5ZyZF2qe
         59bfyMvMEb9+a9CE+mEUL8ygJfLGHqq4yVbiXq1foLkmF66+rFO4FJynN2/155OREjjI
         +hcL/q98IF8DC/VwRfTNMlBVhwLsC9jFcArRcuabTJiYNtDOmgIBnSAhqUVTuFUox9ZW
         riXTEoNqxMf55GwRKwIjb6sGze6AUpMWrJKBy96a+cLzXo9N+PoiAorxoCR1hFYtaZmi
         t/KN2vnQCBij2HL0J0C/u7VgUPuENudYMUttLliX6e6SSlQ8DjZxFs/qXV3EPvZuy1hl
         kNjg==
X-Gm-Message-State: ANoB5pmYxTnobPBkwZrSBKiwA4JUJOK7vbNlSq7Hpk/qIIEuLWU34Mh/
        JOIdS9iKAtkvNaf3397JAunpWlwmcYIzlg==
X-Google-Smtp-Source: AA0mqf4YJcvPTrnfwB9SxJQj7zSWXRYmGMKX0EaC/tn8RkPDskfV7YW9kGN3LU71V3Da614+gWPRhw==
X-Received: by 2002:a05:600c:43d6:b0:3cf:a18d:39b1 with SMTP id f22-20020a05600c43d600b003cfa18d39b1mr7168244wmn.149.1668422211083;
        Mon, 14 Nov 2022 02:36:51 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id g7-20020a056000118700b0022cd0c8c696sm9001984wrx.103.2022.11.14.02.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 02:36:50 -0800 (PST)
Message-ID: <015e90c1-b70e-c93e-d757-1c2a07c35f36@linaro.org>
Date:   Mon, 14 Nov 2022 10:36:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: linux-next: Signed-off-by missing for commit in the nvmem tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221113205734.40500074@canb.auug.org.au>
Content-Language: en-US
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221113205734.40500074@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks Stephen,

On 13/11/2022 09:57, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>    7a69ff9c9bde ("nvmem: u-boot-env: fix crc32_data_offset on redundant u-boot-env")
> 
> is missing a Signed-off-by from its committer.
this is fixed now.

--srini
> 
