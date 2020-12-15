Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E972DB339
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 19:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbgLOSFS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 13:05:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgLOSFS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2020 13:05:18 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1802AC06179C;
        Tue, 15 Dec 2020 10:04:38 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id 11so20265910oty.9;
        Tue, 15 Dec 2020 10:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMRFeUIbcjTyjikgNOJ857uPGqmpi9xkUBCoUW6Tg7E=;
        b=JCaF3dq3ncBNYuGW+mfBJKfgJ16XCKItKvHZ3l8mqXfRdbvVgDBfhiWwpT2ds8FbB5
         Eqdi2EJMzF0viRGJoCh6sTxkYS3wYSLimwTAKa63Ydhi6EMgarmKNGK9M7B7WAcbptsf
         oGIUuQv2EyYo7TDw97+WugGkZqpQKqJDIbPIdNp8S0JMX160XCCLvFihomoJ2zvV1r0Z
         SeyPHiw4ZFlxYsCE4+nJfF/812ZGePAAYnZYtwfiBz+7rVoKLCthQem3dPxmGQOuIUh5
         glSEAmxxx66hTXq3BMknnXv934jxyasEzhvz3jHwY5UmW0q57keNj4i2MWLw6OTrFRpN
         P5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMRFeUIbcjTyjikgNOJ857uPGqmpi9xkUBCoUW6Tg7E=;
        b=P47F/mROKQTZdbnJi+ZfdpnjPeTDytbzB6Z7/yEPr5xfDfTrrj3NsAjaKGPbvs2Jlh
         2rR5ciDdTtMvEyfsppr7e6zh/grJNLehLH/PlVay8LWmoHR6GkKATCjuqhAh/58UNf8S
         fkK617wg58vo/u7fDUJXOGvcdTvMLt80Rn9f/Y9swDLtFFDa6NTuz8znSkOxiTwi4Jh8
         f4+LR9lXpaU3cyVruD6lUTNbu2l9l5vOpsTEsNmA2+RfAHKaw3+lKdm83bIvft2PttE9
         ojLchBukj4d5CWVg5WEEuIiAa7WYRPxTH71nLKr+J/+YvzikmJt5AxtQJjm63Y5DR0Hv
         w9sA==
X-Gm-Message-State: AOAM532gn2M6otyjwEmU6BqyvkrjPmbN8SPHB1NTla2Oooyv8OknJBfi
        hoKOAxUzIsTY9K3NV1MO+aKUBB6QqotD0JB0VzKbJt4lfC0=
X-Google-Smtp-Source: ABdhPJxJXnuqu8PiqtT7zyU8g3KH2Tog5Nt0w85q57IXPSU6+g2cVROLFa2BzBbo8tQhx5p9OGy8MRqt4hWIWHlUZ2g=
X-Received: by 2002:a05:6830:1d66:: with SMTP id l6mr7450265oti.23.1608055477225;
 Tue, 15 Dec 2020 10:04:37 -0800 (PST)
MIME-Version: 1.0
References: <bebf5028-9a3e-59fe-ea70-c5e5e61fcb72@linux.intel.com> <20201215172552.GA310296@bjorn-Precision-5520>
In-Reply-To: <20201215172552.GA310296@bjorn-Precision-5520>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 15 Dec 2020 13:04:25 -0500
Message-ID: <CADnq5_Pp08peDVs6U6V4PqBYVdUgLp-pvrFzFOf8OjbGHO6Z4g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the pci tree
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jay Vosburgh <jay.vosburgh@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sean V Kelley <sean.v.kelley@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 15, 2020 at 12:25 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Mon, Dec 14, 2020 at 10:52:26PM -0800, Kuppuswamy, Sathyanarayanan wrote:
> > On 12/14/20 3:37 PM, Bjorn Helgaas wrote:
> > > On Mon, Dec 14, 2020 at 06:18:54PM -0500, Alex Deucher wrote:
> > > > On Mon, Dec 14, 2020 at 6:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > On Tue, Dec 15, 2020 at 07:34:31AM +1100, Stephen Rothwell wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > On Tue, 8 Dec 2020 13:56:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > > > >
> >
> > > >
> > > > I don't plan to merge this upstream via my tree.  I was just carrying
> > > > it in my drm-next branch because we have a number of users that depend
> > > > on it for working DPC and a number of people use this branch for
> > > > testing.
> > >
> > > OK, thanks.  FWIW, it's currently marked "Changes Requested" in
> > > patchwork, so it isn't really going anywhere right now:
> > >
> > > https://patchwork.kernel.org/project/linux-pci/patch/cbba08a5e9ca62778c8937f44eda2192a2045da7.1595617529.git.sathyanarayanan.kuppuswamy@linux.intel.com/
> >
> > There is a newer version of this patch set. Please use it when
> > merging this patch.
> > https://patchwork.kernel.org/project/linux-pci/list/?series=370855
>
> That one is still pending.  I haven't had a chance to look at it yet,
> but seems like there's no point in carrying the superseded version in
> drm-next.

I'll go ahead and drop it.

Alex
