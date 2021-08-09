Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357643E435C
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 11:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbhHIJzx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 05:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbhHIJzw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 05:55:52 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC96C061796
        for <linux-next@vger.kernel.org>; Mon,  9 Aug 2021 02:55:31 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id l11so4142291plk.6
        for <linux-next@vger.kernel.org>; Mon, 09 Aug 2021 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=njx7c6+9wwA5X4lpJAmyr5NBuDZKm/2/00nAyGm9k3c=;
        b=A6HsFJTtWkUFXXd4aLs1v0S4FAaWZ6FzJBH/6lqJy06Wopt1mFdbBSMXJtzJqTR8PB
         BHAsY13ADf4bd6erQ6Gp0bYhRVC0eaDV+2RRW83GRuNl1qEGEZnWHMI22SoXewA23WXG
         +ipT1jQ8aD7+dAJe2SS6kAW8FTxLH1AovNzz2G0Jcf0viG7WS2uOj4DIqiIjWdudmL/l
         7CNQ0q1aFU12N6lL7qQ6yndyJOw7lwwc45suUG7A7ZAWzTjJu9u8mTtQBjeW2usP8Ot5
         KGVod/uc7JxyyPTv+qP2SREFlBpCZh7a7MoZALGqUrnHd/sGqqhVQiWRmySqbWRV94XW
         y8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=njx7c6+9wwA5X4lpJAmyr5NBuDZKm/2/00nAyGm9k3c=;
        b=i0OuXyYauX8PPKD3+fwB6DxUsHf1tm3ghwvKs/drxy9Ham8emJA4zx+qNEMUK/d/Ui
         lScZI9GdxlYl+Ya7WbS1BfkYUZ3WiN1OTO0ON05XtENBCPYcaDVzYpdWTyghsElysKR5
         gKxewbEhMf4OBxJC0ZwjE2pdZLG6sJmBqNoi6ZzBg++yDhYp9XAPOxN54zSTEHQmbm0g
         CMI06jElWiEYPpX806vtld1W7AsirjAml93ADt6MM0AebsWzMyB8IlIzKvU3peLFlXVi
         WfgcsUS2nCWkI91lgoaP/qBVrMfiublO2NUpdebFPJdyo3iNZm5cYNfiQfnw98pSYtmC
         HA2Q==
X-Gm-Message-State: AOAM533A9uP5I/B9oWo2R5+SvPibwR8poHHO7Z4NNRvam0I6PUoYbhBG
        hKhoQ08IyiO5TgZDoVHd+2RIwV63U/ME
X-Google-Smtp-Source: ABdhPJzkchZ9TKCH/nJ58d9SDnhGhAbgyFy3EDYXD4WWzkELI2NvyiPzAdxMJGpUETw3oBycIuLFGQ==
X-Received: by 2002:a17:90a:9747:: with SMTP id i7mr24897101pjw.141.1628502931254;
        Mon, 09 Aug 2021 02:55:31 -0700 (PDT)
Received: from workstation ([120.138.12.137])
        by smtp.gmail.com with ESMTPSA id p190sm20015973pfb.4.2021.08.09.02.55.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Aug 2021 02:55:30 -0700 (PDT)
Date:   Mon, 9 Aug 2021 15:25:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20210809095527.GA13990@workstation>
References: <20210809193837.373a9f68@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809193837.373a9f68@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Aug 09, 2021 at 07:38:37PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mhi tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/bus/mhi/pci_generic.c:406:40: error: redefinition of 'mhi_mv31_channels'
>   406 | static const struct mhi_channel_config mhi_mv31_channels[] = {
>       |                                        ^~~~~~~~~~~~~~~~~
> drivers/bus/mhi/pci_generic.c:372:40: note: previous definition of 'mhi_mv31_channels' was here
>   372 | static const struct mhi_channel_config mhi_mv31_channels[] = {
>       |                                        ^~~~~~~~~~~~~~~~~
> drivers/bus/mhi/pci_generic.c:417:32: error: redefinition of 'mhi_mv31_events'
>   417 | static struct mhi_event_config mhi_mv31_events[] = {
>       |                                ^~~~~~~~~~~~~~~
> drivers/bus/mhi/pci_generic.c:383:32: note: previous definition of 'mhi_mv31_events' was here
>   383 | static struct mhi_event_config mhi_mv31_events[] = {
>       |                                ^~~~~~~~~~~~~~~
> drivers/bus/mhi/pci_generic.c:424:43: error: redefinition of 'modem_mv31_config'
>   424 | static const struct mhi_controller_config modem_mv31_config = {
>       |                                           ^~~~~~~~~~~~~~~~~
> drivers/bus/mhi/pci_generic.c:390:43: note: previous definition of 'modem_mv31_config' was here
>   390 | static const struct mhi_controller_config modem_mv31_config = {
>       |                                           ^~~~~~~~~~~~~~~~~
> drivers/bus/mhi/pci_generic.c:433:38: error: redefinition of 'mhi_mv31_info'
>   433 | static const struct mhi_pci_dev_info mhi_mv31_info = {
>       |                                      ^~~~~~~~~~~~~
> drivers/bus/mhi/pci_generic.c:399:38: note: previous definition of 'mhi_mv31_info' was here
>   399 | static const struct mhi_pci_dev_info mhi_mv31_info = {
>       |                                      ^~~~~~~~~~~~~
> 
> Caused by an newer version (but almost identical) of all the mhi tree
> commits are also now in the char-misc tree (almos identical patches,
> but different commits.
> 

That's due to sending the patches as a series to Greg instead of pull
request.

> I have dropped the mhi tree for today (please clean it up).
> 

Done!

Thanks,
Mani

> -- 
> Cheers,
> Stephen Rothwell


