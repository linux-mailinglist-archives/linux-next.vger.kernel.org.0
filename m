Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B85D138820
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2020 21:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733293AbgALUBo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jan 2020 15:01:44 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:38896 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733064AbgALUBn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jan 2020 15:01:43 -0500
Received: by mail-il1-f194.google.com with SMTP id f5so6131324ilq.5
        for <linux-next@vger.kernel.org>; Sun, 12 Jan 2020 12:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vltSl3yoS/o4Pj3eivfuysNtj4INdjuW6Z4PNbKDFMw=;
        b=kVUKzsKNr/UN1LgzbrH3VmkkKF/GgSjl47zvtaJVSsJ4ANthVbnW21/egA78M/fnrl
         IfpicMsnXfcbxwEqpieyIAu8rZRsUkSQRo/OPoNmBXJgds0yfPDiduhz+VPWjSk+tw4S
         dYJ4Iug6HP0lwCjKdXgp0ltM2EaGfFIhJlSMu3sjA13JJMNDfovRQT0axtVMsKmy7QeG
         97lJNUoTmoQFhyrPZb5ZJHgZF4Tw67Kd0VGatq8d7xoZCL9rnyXYoLYrTLM+LRVDbrrn
         BI7LN23YdH7gkAhLbb4SXaSD+V+WoL4rQIyWhZfvMuQ14H4G79pr3EyrPWvHL2bNFpYt
         r1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vltSl3yoS/o4Pj3eivfuysNtj4INdjuW6Z4PNbKDFMw=;
        b=Ti1xmVbNiYpeiO8d7Qi1b+LQyqcJgaqvY7kSfI8dC+lUJxJLJZCHLS+o8cCpG/MIUy
         rtPy1HQMen1+qTy2U+4n/3hnABWv96W3+DOV4k0y/sLMcDSgZSgNhlYQ6UVNCSRiidr3
         sNg+KP1LJuLiPxBj44BNwDtgahdvjl9VdzLzqTdK+BGVqzrX723lvlE7/ZQk8SwFDo1r
         J0vriLxlOa9iP/L2IsGowEdawWLvNO5ybjppv0Ut+ONxWZoLdpV2Fr3/xgRgp42BdEUT
         pNFKO0pXiSH62Hw7KfHP0OKwO3tXO9tef2uvf8RNCc66N2J/gG7LQNiIgkFhuV1hs+kL
         ZJTQ==
X-Gm-Message-State: APjAAAVUPYfP+k6vHGqUJPXmuqX16fAxO6TX7ETBO+q4Xfln/Tm1J8u7
        0sbgwBi2nI/IilYxhnNbWdxouuqLofOR9fHdhZeCPg==
X-Google-Smtp-Source: APXvYqxhD0AB5i0ZIFt3OAw1DMt1N8WD3Cw6RX5iRKqkktFYUteW/DA4rDMoJZRrtrEqDiSmAxbWzcBPtQpncRxq5eM=
X-Received: by 2002:a92:afc5:: with SMTP id v66mr11073775ill.123.1578859303168;
 Sun, 12 Jan 2020 12:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20200113065622.15eb3c87@canb.auug.org.au>
In-Reply-To: <20200113065622.15eb3c87@canb.auug.org.au>
From:   Olof Johansson <olof@lixom.net>
Date:   Sun, 12 Jan 2020 12:01:32 -0800
Message-ID: <CAOesGMjZQTjos9fU52zsrKFZj9LVE3oUXQFpjJov3-dBD0cT+w@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

On Sun, Jan 12, 2020 at 11:56 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> n commit
>
>   0ff15a86d0c5 ("ARM: dts: stm32: Add power-supply for DSI panel on stm32f469-disco")
>
> Fixes tag
>
>   Fixes: 18c8866266 ("ARM: dts: stm32: Add display support on stm32f469-disco")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
>
> Also, please keep the commit message tags together.

Thanks for the report, we'll keep an eye out for these formatting
tweaks in the future.

Alexandre; no respin needed to fix this IMHO, just something to keep in mind.

-Olof
