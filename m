Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E25225773
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 08:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgGTGOD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 02:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgGTGOD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 02:14:03 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F497C0619D2;
        Sun, 19 Jul 2020 23:14:03 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id a32so12143056qtb.5;
        Sun, 19 Jul 2020 23:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4WkbcnELK8qF7TZXeRSjvQCVSZidMYemBo24Bv/PnJE=;
        b=guPVm8CqCO4pIK7JhMgK5yI5MrFSSmXLjjXWlSJmeypBxID9d53IlPs/V7oJz+20Ng
         pHWheuRToTZJNuEq9682UtjPy4Aw2DHCHD68oB4dVX6R9uaAnD/cHlZQxAWCe0vyc505
         dG47UsVf9GcnyTdwmdI+rC1ulnQHQ/z4zVWiSxHmElAPcwGf4OAzYrWQDii4Tcyt12xs
         xdpSNsClbZrzvwzL/g9tpCAnGpu16643EXV1276dslLkXdok2yQz6CNzLyMxFIs2u303
         SbB/foTgcHk8+LYrLZHgKGHQt4P9fdfVBHwyX/PsyWXFN92dN5RSx20fFBkmaSbfkO4L
         Pzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4WkbcnELK8qF7TZXeRSjvQCVSZidMYemBo24Bv/PnJE=;
        b=lEQUms/b9CcMWn3ikzyTPgs5B3cHtAzTcS9PliDZbxB5IFfrGEL+jmZbEldDoelssb
         GMl0nSCnu5cYmXwWnzLbjFIhapR6pAJ8lf0KJfQv/5pR3k3Pnx/rgMcOh5YsnO7obHIu
         GTsC8CMNZgkaJUVuomkNqgZwBoLBpiB3k7lNHNvJxb+i5BHTyg1agfyTooGb1vDus2GJ
         ibJ1Fb5pxAj93U0aawL6iQn0eOQkTbuxvNjfJokVfr97PNWLFn49xhWvnQ2TCnl7pdak
         MV6ypG8PGPlfNKjsWdOxkH0uxWQXQduaMhfsW8BtpVD8zl9fxxgeptV8dJ4Kxb7UPyYr
         tqqg==
X-Gm-Message-State: AOAM531m7172wmGe+/gFiOBTWvHvUU9wsTLobzAfPCSx7dTEyIHFTdMf
        BwzNBnNqtlfgh3EFAqXzJ6vdPMCCh8iTAlkEmGU=
X-Google-Smtp-Source: ABdhPJyNjaM9Ss6Z8LkNDDjMhEDzwYL9DpjRxCnbGGdjfEI6LVo+Cpd7WfwWL9m1KtJ0BPc/g6OfUuccM5XohrXWmWs=
X-Received: by 2002:ac8:4cc2:: with SMTP id l2mr23168875qtv.225.1595225642589;
 Sun, 19 Jul 2020 23:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200717144656.4bdbf81f@canb.auug.org.au> <CAFULd4Ye2d-8BY7aY+_2tYwcXsfSCe3O6aJ4LF0KhvWTjVt0rA@mail.gmail.com>
 <20200717064401.GB2504@gondor.apana.org.au> <CAFULd4b9O+KJKwjQTB1PTuxMEDSDMov0rQaE85+9pfRrd02dKw@mail.gmail.com>
 <20200720140346.109a3006@canb.auug.org.au>
In-Reply-To: <20200720140346.109a3006@canb.auug.org.au>
From:   Uros Bizjak <ubizjak@gmail.com>
Date:   Mon, 20 Jul 2020 08:13:51 +0200
Message-ID: <CAFULd4YGFGSVqmHuor89e_hk9wT5pso3jcRiBkHP4ppx+W-D7g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 20, 2020 at 6:03 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > Please find attached the incremental patch that puts back integer
> > parts of inst.h. This resolves the conflict with the tip tree.
>
> The tip tree change needs the XMM parts kept as well, sorry.

Strange, because I did test my patch with the tip tree from
'origin/master' at commit a282cddefe90c4b21ef2c22a76a7c3ebd3ec6b86 and
the compilation produced the same lonely rdpid %eax in
.altinstr_replacement section. AFAICS, the header is included only for
RDPID macro, where XMM registers are unused.

> So I ended up just removing the actual now unused crypto instruction
> macros.

To avoid any further troubles, this is also OK with me.

Uros.
