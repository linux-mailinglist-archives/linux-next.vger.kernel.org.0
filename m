Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E330C3FAED8
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 00:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235991AbhH2WM2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Aug 2021 18:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235905AbhH2WM1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Aug 2021 18:12:27 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39833C061756
        for <linux-next@vger.kernel.org>; Sun, 29 Aug 2021 15:11:35 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id z2so13783086iln.0
        for <linux-next@vger.kernel.org>; Sun, 29 Aug 2021 15:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gtoYl7kiNjX3TbLNo3eXXB5Snple9cEEruGWOWNoSu0=;
        b=U98asr0mRpi1ANWcBZWBGLpmqWSU6HUFP431VThGIIx2Dhe0uJjIKFODAZaT7sRfEV
         Vw+3XL3mwkCIC1vy6vesHRAFGI4ourUW3faDpgr3azgkBkpoyfVgD/iWDhORFwkURSJz
         w5kX9CpqckkymE11CPjeMo55wFEzHfapGeleJZbP7Vi9CTLTwwfuvk+X8ED5fNTuFgAa
         B2ggxSsNRilaOuQze1MqTLthM2FlWd8HfxutU2gJtir1C1hm8bBdbubnssTdNPlbeDCE
         BY24Gueqzm98+gLXW9wvPyMy84NB2+AttperenmX8fQsrP9QDWmSLcG6UsLHx8Me7ASx
         xBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gtoYl7kiNjX3TbLNo3eXXB5Snple9cEEruGWOWNoSu0=;
        b=FNWpWKhLkIbjIa3BE3TEQ4uTAXqVeFa7fm92/9zxAc4M+lgaPyN6idMKOg/JU4goHS
         oyOqaxQE+iPbLoNq51BLaz/lB7LIXshKj8UchFMv8EC6OnZN1t616A9tYDv1/cK7lnPy
         i04NALZIkarcWNApq+TgRhMzfvzMOYDJOQxZTfNhES84nQQ/df6YSJzp16AQHyHJQwa4
         SiYOx1FJbSPo4ie7cI44DOdxDnD7KnIXJ5AwcaMjkXA0UoODHmpvWFsZuz2Cn3AIwIUz
         O3R17A8/Th/h1kSUf4dHgRj0ke9n/UoPXllKhGWQHyPl8LLSXr45EX48Gra6fmp12JGa
         2JvA==
X-Gm-Message-State: AOAM530pk1hQm+cSGcg8o5/z2NNZ4jHEuRNjDPi60iB5hBvk2Tu2xN4w
        bGgGF4+fsvj/DzNy5W24rY13auztgFJG0g==
X-Google-Smtp-Source: ABdhPJwQ1ZgoVSLy8sGEWoc30jIrKltpYXFP7WCPG03ooDuF0J5ydYAo6XUDkzAX1OVakNG8aR7xPg==
X-Received: by 2002:a05:6e02:1888:: with SMTP id o8mr14221155ilu.124.1630275094416;
        Sun, 29 Aug 2021 15:11:34 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id k5sm7144836iob.45.2021.08.29.15.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 15:11:33 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210830075224.0f234b14@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <a9af10c7-a597-f323-638f-3ee28492786c@kernel.dk>
Date:   Sun, 29 Aug 2021 16:11:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210830075224.0f234b14@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/29/21 3:52 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   2f7eff262585 ("io_uring: allow updating linked timeouts")
>   132bf9af1d0f ("io_uring: keep ltimeouts in a list")
> 
> are missing a Signed-off-by from their committer.

Oops, will fix.

-- 
Jens Axboe

