Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD18432DE68
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 01:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhCEAnc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 19:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhCEAnc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 19:43:32 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A795DC061574
        for <linux-next@vger.kernel.org>; Thu,  4 Mar 2021 16:43:31 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id z11so930036lfb.9
        for <linux-next@vger.kernel.org>; Thu, 04 Mar 2021 16:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HgjUsYyNPY4yZXLAKbwff0hARy73LXck0x1rGp74pGs=;
        b=qS671o59ZmTLc4L3782I1RvzzA78UWPNaEHX92gAZ5J5MZvQXLDb/CyY6aKUyO6630
         MQAyVklghHneBlFbTxsnu57JEk+5Y7oODyN1chUrstYcCUuRG5gCSLUCJhZzwS+Kcp4x
         f8hkl3FJUIi7kfq6GEkVaNjpi5nBWfpStdPtGXzuFi5TF44gSIfjy35LO89zEW0WH9jc
         QoNFVJXLQQ46gajlwjCp/5QB7mHiW9u91xXCpPDIjehi6EvyVFR1oxbKwIun7Nzq1tFh
         rzlGlvjbrtGfFXF5RVAryyxSK2E6zQafv+uLuujSKO5bmIDTH5bYXh0LWMvg5tIWgCot
         5law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HgjUsYyNPY4yZXLAKbwff0hARy73LXck0x1rGp74pGs=;
        b=bq/kr0qkpFJztMjZUffyMFRy0QLFa2l9Q1tWF3+m4RA3/VGIzXaBJF5Q9Ml20ard5r
         krlRV7IXzLjJcyDJk1eOkrhLBY7o0hwaXmdXNzj1Tt+G8xploPOBYmbgxhPQp+OJozJ3
         h8sqSnXV6aUkxEwps3qRH7CkVzfmkEyb4EIWL02ThApFc9+ZtdEV0aBL0XSfvEpgiarX
         8bCgB+ZKN4k1stP0+BeQArPgd9nPg5IFiocyXlx1mcflFog77vYOhpB1fJytZifsyPZB
         ZX0JJgwe1KuUGouvx2boGc7o4RdrKRmZqJdl8ABxYpxS/lc6vyS+S/ZZzcGzJevAOwW7
         FeZg==
X-Gm-Message-State: AOAM533EnTjUMSYds4vYJ4K0vJmlIHFP6YVd+ZiGe4dAu+Y4QVfvxJho
        c+o/A2ng4EmUjmrPA9L9XhjVueXXcUG1TTyuGpfwsoUkSV3okw==
X-Google-Smtp-Source: ABdhPJyNWdP8ys2vWKileWPlFYfUpJrCPa7a2HuO+f4p3oaYXTr9mcpHrA8TmmrWi6dAIy1X/lvcUJMuVXlKxhXaXuo=
X-Received: by 2002:a19:548:: with SMTP id 69mr3804625lff.465.1614905010192;
 Thu, 04 Mar 2021 16:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20210304121206.3a7ed310@canb.auug.org.au> <CACRpkdai3LnvJgaKKtP+Y+zgxyQ2Rir1k-CbX-6cbJPnYuvOaw@mail.gmail.com>
 <202103050813501649431@rock-chips.com>
In-Reply-To: <202103050813501649431@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 Mar 2021 01:43:18 +0100
Message-ID: <CACRpkdadRm8xXENJNM+yrJp3w-gyB=hejcYMF6qpQErwbYL69A@mail.gmail.com>
Subject: Re: Re: linux-next: build failure after merge of the pinctrl tree
To:     "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 5, 2021 at 1:13 AM jay.xu@rock-chips.com
<jay.xu@rock-chips.com> wrote:

> Could you show me the issue log ?

It's attached to Stephen's original mail in this thread.

Yours,
Linus Walleij
