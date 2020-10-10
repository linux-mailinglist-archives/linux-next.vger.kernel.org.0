Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436FF289D81
	for <lists+linux-next@lfdr.de>; Sat, 10 Oct 2020 04:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgJJBmx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 21:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729477AbgJJBJd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 21:09:33 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9810CC0613D7
        for <linux-next@vger.kernel.org>; Fri,  9 Oct 2020 17:44:17 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id o8so10635867otl.4
        for <linux-next@vger.kernel.org>; Fri, 09 Oct 2020 17:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Hr4iqz1zXiGE5F8nA2GbUk9IFxQda7DmEEnM9pjKIvk=;
        b=eL0WG8mhu0NUkj8rsFaLL8jlh084Z9GrApbIiHLw9ENO1Pnvqb4sLtYR4nDBcCdMDm
         e6aHLTC+KrMtiLMoisPTr5mnFMp3j/UsUlUAShRlx7TnSvwvNU68frVz0cJdHW5GU0uC
         KaisKf4Mqy42md6I6QTamhWnjKnglK8ZqNpoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Hr4iqz1zXiGE5F8nA2GbUk9IFxQda7DmEEnM9pjKIvk=;
        b=MKK1ui2Hu/8YiiknZq+Qk0nEcFL00haywk1oN9mWHHPxEvn5D0TKiOIZofOjfPk9tx
         7Cv9k+ned+3QlznTrjTKSvgeZoCApWhG2vYGx1AsveRQt1teFrubWOhOonMnvg1ecfa0
         nYrUq18Tiy4pfTxRRvC9QVOcQ9AYYbjXFGevcszuijtK+FBxUcCI3L/EbwGqCa5+U5Eo
         ASNtBSWHIqygioI0DdOjFZRKo1z5ZqhJn7sXC/qj39yE6SA0+l/uqmtcDqJ2Q+i8yt8l
         EUU/vohcsfR/1eXQzUtiTo8lqWqS8MTYqVJvPQihDGzd5BFuL2IO9JAH9DBgFGPGouRV
         Cnhw==
X-Gm-Message-State: AOAM530OvC0SReLNnnOkXx9+ZOqalsbQVX3op4T3LR0t8qlvAvFUwZVc
        mCLLZUzeG6bioNejtxvxlW78HYVQdnMNlw==
X-Google-Smtp-Source: ABdhPJzOJP5s/gDHeCShOQNHz7yquri9d0ZmoGsyOaPzehSG6/CknsOKpJdoZvfRcb0TuF0Kz8wH9Q==
X-Received: by 2002:a9d:68c2:: with SMTP id i2mr10671947oto.166.1602290656636;
        Fri, 09 Oct 2020 17:44:16 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id t65sm1329637oib.50.2020.10.09.17.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 17:44:15 -0700 (PDT)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     skhan@linuxfoundation.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Subject: Request to add counters branch to linux-next
Message-ID: <ed25ab31-0e76-233c-34de-4e227c0b5801@linuxfoundation.org>
Date:   Fri, 9 Oct 2020 18:44:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Please add counters branch to linux-next

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=counters

thanks,
-- Shuah



