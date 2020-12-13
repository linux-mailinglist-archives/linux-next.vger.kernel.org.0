Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCAC2D8E85
	for <lists+linux-next@lfdr.de>; Sun, 13 Dec 2020 17:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgLMQLJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Dec 2020 11:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgLMQLJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Dec 2020 11:11:09 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7440C0613CF;
        Sun, 13 Dec 2020 08:10:28 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id o13so838514lfr.3;
        Sun, 13 Dec 2020 08:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jjg4//HL15kVKx9ksByA9o5F9EQc5/tLBA+Ck2F+axs=;
        b=jDQHW9D2Q7nvo/ttByJH7Cn0/i4C7LGJT8HMKZqpNGvlW5HshFT0PVZOXF/nLbQgYn
         V1ZIFBHlP9PKkXzTYjAO7LPMzrjMDEehYK8RWasCi2Ygkfdpu3ISfawgPt8b4mUtdj/r
         uAjjAdH9jSNpa/2dm2aZR1zKPKd7a5emeoZeShvBLQPUxFLhHu9ec1khoEc+CKIXRqqA
         Xo9QMEYal2Jux3fNYDkRmbqBz9DaDR23jZJrp1Iv687XhCMxpMdc9m8bo1U4yjAecnum
         9J/0vqLOOhGVbAiDTcmC+/ZlswVZBYiPPEIfz1i3FqJ1WrdksOwIcOZJWvqPK+eOscnz
         YQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjg4//HL15kVKx9ksByA9o5F9EQc5/tLBA+Ck2F+axs=;
        b=aXb3E0eAX+VzUPmsJc40PD4h+VYo/rUmjABenvPkQmovfQSO/7PwPld/sF/hlTdHgp
         NPb0mIXg/Y2o0HhqVj5JFuXblihj/ycI6yBjgJYmIK8YTTwEPi5lHVoMSg1rsBm6QohS
         W74N7vVund8neZr4WiAPhLNKFqXfcTM3g2FcN1YhDOLzSUrmBNorgmv1SJSSGc15FP/a
         szOkfmMj4cw1ll/2fFenrQPuIgbBaL9ZTAOhjvXeNAVo0DWBdAVRi6nFzLYAMPMMzldF
         zmrcj4MDLfl9ts4xKCR96DC1seDN1J8c4UFvK4GhC5ARypdXAl+5PwI5TxFcHVcxW2oF
         tGZQ==
X-Gm-Message-State: AOAM530XAxElMQymiFJWt3BDhNO+e/KI9LwvTi7xOmLLk+dgt13Mv7XL
        X1zU81AemaJY0VHFdfvQfZAJ0SirV1vtj+XyQPmg90yrHJM=
X-Google-Smtp-Source: ABdhPJw8Dms7TdXhXRjjYxNusLkbqxZ4H8QpXbG7OiOK9BHcbNh5nE2BlOvfQE8Rh5eH11IUSbpcObZ05BwxQjeE/hM=
X-Received: by 2002:a19:950:: with SMTP id 77mr7550717lfj.133.1607875827132;
 Sun, 13 Dec 2020 08:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20201213211434.27bf402f@canb.auug.org.au>
In-Reply-To: <20201213211434.27bf402f@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Sun, 13 Dec 2020 10:10:15 -0600
Message-ID: <CAH2r5mucc7t_gyFRnbsreT5-bOmpG+c66oNfUOK4ZnCuD3GwvA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed and repushed to cifs-2.6.git for-next

On Sun, Dec 13, 2020 at 4:14 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   3aa4e616197b ("cifs: Register generic netlink family")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
