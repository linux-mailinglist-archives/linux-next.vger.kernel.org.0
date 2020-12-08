Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352002D35B3
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 23:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730248AbgLHV7m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 16:59:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:43878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730232AbgLHV7m (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Dec 2020 16:59:42 -0500
X-Gm-Message-State: AOAM532UVW0l4yw/fsppw8frk2jk7qF0dG2ZvIZGesH9LmIyFLaH76ev
        b+nJw8ROD4DXCZr8DHiy1Tarok2FFvBevr6RKpG6Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607464741;
        bh=aq1REvmr8G4HHsMmI7IDmZOap2E/6/9t6PDlS39WANU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gUWX7QEivlEBbfouHMgr400icneCDEUYZL6Vgvd+W7VFDbPj5ioDZEsyxrKScpxna
         FOoNjLl3Fb014TRLuxA2Qix2nLq+Rj9xAR5I9b86gxL6deMLjVYwB6lMYsxTBH5Sl5
         O+F+9cv7u0QFG+3oBhLKYxiM8SFMHGf/VFulCwRtR3o31NbmbBqhNxDRU7XokLe+Pr
         PNZHYhRUVU8G/PoZ9uy+plQfCMLlIhKwk7Dn7QUfjC2r3tHp+/TRgm+OsSkDTVBlwD
         iwLJLxJGHsKqwcSTgFUtRZ39gtMwRIvnj8qNOEGvmmfGoGDfz1Co0DWTndFptZ45H/
         TAPE6CrL0C63Q==
X-Google-Smtp-Source: ABdhPJz1BNeZy2zJhsVUwUwxQH6zhCY3cVJMR3mDK3yUi89dUtazop/iQ5s8I/mdJXZsMaJhBcUfaFKL5jM5H0sW15Q=
X-Received: by 2002:a2e:9611:: with SMTP id v17mr584959ljh.69.1607464739743;
 Tue, 08 Dec 2020 13:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20201208173623.1136863-1-revest@chromium.org> <20201208205240.hucgnmi76ng2r5s7@kafai-mbp.dhcp.thefacebook.com>
In-Reply-To: <20201208205240.hucgnmi76ng2r5s7@kafai-mbp.dhcp.thefacebook.com>
From:   KP Singh <kpsingh@kernel.org>
Date:   Tue, 8 Dec 2020 22:58:48 +0100
X-Gmail-Original-Message-ID: <CANA3-0fHyriceUjbSLBJgUA6oddGTRBuP_PwAyWar8o9eSPoaQ@mail.gmail.com>
Message-ID: <CANA3-0fHyriceUjbSLBJgUA6oddGTRBuP_PwAyWar8o9eSPoaQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3] bpf: Only provide bpf_sock_from_file with CONFIG_NET
To:     Martin KaFai Lau <kafai@fb.com>
Cc:     Florent Revest <revest@chromium.org>, bpf@vger.kernel.org,
        ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        kpsingh@chromium.org, rdunlap@infradead.org,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 8, 2020 at 9:56 PM Martin KaFai Lau <kafai@fb.com> wrote:
>
> On Tue, Dec 08, 2020 at 06:36:23PM +0100, Florent Revest wrote:
> > This moves the bpf_sock_from_file definition into net/core/filter.c
> > which only gets compiled with CONFIG_NET and also moves the helper proto
> > usage next to other tracing helpers that are conditional on CONFIG_NET.
> >
> > This avoids
> >   ld: kernel/trace/bpf_trace.o: in function `bpf_sock_from_file':
> >   bpf_trace.c:(.text+0xe23): undefined reference to `sock_from_file'
> > When compiling a kernel with BPF and without NET.
> Acked-by: Martin KaFai Lau <kafai@fb.com>

Acked-by: KP Singh <kpsingh@kernel.org>
