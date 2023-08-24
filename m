Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7D4787173
	for <lists+linux-next@lfdr.de>; Thu, 24 Aug 2023 16:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241569AbjHXOY6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Aug 2023 10:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241624AbjHXOYh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Aug 2023 10:24:37 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462F91BC6
        for <linux-next@vger.kernel.org>; Thu, 24 Aug 2023 07:24:34 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-792244506f0so8203939f.0
        for <linux-next@vger.kernel.org>; Thu, 24 Aug 2023 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692887073; x=1693491873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2rdgs0bNKtgv3WwpKskkcELp4/NYKTYeYa5R7hjORQ=;
        b=PghVr6XpNCTC0YcDXEWmX/8Sbx4aRWMVPt5TN4TWeOJ8+ziUkKoCvl80ZP8/Eoap8v
         H66hGolecyFr0Jkaazv0hsy4+A31lSVeHkDOOEoumEXA8eZzXGh8Tm/q/u0FMtq1fpkW
         uokiXm+KVbjSB//5WcOzrNNjTsSf12jCjHqEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692887073; x=1693491873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u2rdgs0bNKtgv3WwpKskkcELp4/NYKTYeYa5R7hjORQ=;
        b=I0bN/wxx6Fhfm18dQsDlSgfUO3mdkYlz7YcvfRbmGcRuHnMUVcNbnMVk+/EoVxv3IY
         2zBk+VNCd3QYArDRvXUas333jzhQb4k6+EGot38eJfFi1X+wjlFMc8o3R/4FGWdYGqKN
         yRsxe2q7OwLpz85dclkKSwhUl7F7sR2cGioVyX0Sqe5cg0cmRLm9MSJ00sP1AG1z/FgX
         65W7HJL505uKkm2VAWBaIRNOa5oS8Ail1FYCeaIIULhQo/RpYJ9oZ3RylP0VxSkYd+E5
         I3xgISstmes76qRD2r1G7kU5ldXoLTOLf80u4vgA8dGTb6BX/Rvtuayksnzu2Is6Q73H
         /LxQ==
X-Gm-Message-State: AOJu0YwN9ryZ6cn9I64/YgkgVr8zNJd/OlguNBMsU83vBXvS82zQPjVd
        fj1SszILclNYx3TMP5yCpo3mdg==
X-Google-Smtp-Source: AGHT+IHo52NzvdB/s7cLnaajlVu450EcadR2gri3DooqQ9t5Se11B1M7Gtd5esFo7mhSRsx0N+sbFg==
X-Received: by 2002:a05:6602:3706:b0:791:e6ca:363 with SMTP id bh6-20020a056602370600b00791e6ca0363mr19829661iob.1.1692887073656;
        Thu, 24 Aug 2023 07:24:33 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id dl28-20020a056638279c00b0042b320c13aasm4550889jab.89.2023.08.24.07.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 07:24:33 -0700 (PDT)
Message-ID: <b7105474-bec9-f08b-b623-bf350909cab5@linuxfoundation.org>
Date:   Thu, 24 Aug 2023 08:24:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: manual merge of the nolibc tree with the vfs-brauner
 tree
Content-Language: en-US
To:     Christian Brauner <brauner@kernel.org>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Willy Tarreau <w@1wt.eu>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Zhangjin Wu <falcon@tinylab.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230824141008.27f7270b@canb.auug.org.au>
 <3028a552-bd75-4ded-9211-62d10768d9ea@t-8ch.de>
 <20230824-moment-wehten-5a47e319ae66@brauner>
 <26bc62c7-32c7-4ef1-b8d1-77738fa98598@t-8ch.de>
 <20230824-randfigur-emittenten-de303734445c@brauner>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230824-randfigur-emittenten-de303734445c@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/24/23 02:52, Christian Brauner wrote:
>> Anyways Linus should also be able to resolve the conflict for v6.6 with
>> a small hint in the PR.
> 
> Suprisingly, we've done this before. :)

Right. This is how resolve these types of merge conflicts. I will add
note to Linus about this one.

thanks,
-- Shuah
