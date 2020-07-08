Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391AF217CE3
	for <lists+linux-next@lfdr.de>; Wed,  8 Jul 2020 04:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729195AbgGHCAS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 22:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729047AbgGHCAR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2020 22:00:17 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB27C061755
        for <linux-next@vger.kernel.org>; Tue,  7 Jul 2020 19:00:17 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t15so477159pjq.5
        for <linux-next@vger.kernel.org>; Tue, 07 Jul 2020 19:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u/NB405Z1TGjtZAiReLViP52ut2JNiZUpUX2+/hS9zQ=;
        b=MBlkOOaM9paH9hQQovavkqmNpn6kimzpHHW9Rwxu1Xw10PwIN6ecI8JMDcOm5bBlx8
         qOUmSzTCMHcjWpgEzImM9swC8CZYizzpva6FG30NPA0Dv7w4ua+e0bMfQk0lHKswaiXi
         3+kInOqVKYo5kxRGcrRBgpq+DRw/nsEPL2dzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u/NB405Z1TGjtZAiReLViP52ut2JNiZUpUX2+/hS9zQ=;
        b=N3kowTGm6ZmXIYBqI3oJBs4KOKgQCPX6Z7zC07mkyDhkOosiBX2SieRI+nKmI9ciC7
         B5HFTxOSOdVHPuREGlC4XIsrBsKK690716dTNwiTxgOk2nPCtS3OahJ7Pm58O3qY+bha
         N1ytTOUbosHZL+tsdt/2ivQIjLysAR0sAizcqv4NFjzmFYinu09jXCC3oL6BSIa8CPBX
         XmRJ7ulpU8cNfWtHWtKj6T4nyd5RJMI65iM/OVcR3P8cjciETI5ercSTqfx1sGS6iiNC
         zG+gg3YDNJtF67voCvypzGEIpcFRmWsj8RnRB4WghJluGwOYS2Xvx/TW81pxHWUZLVoN
         8VXQ==
X-Gm-Message-State: AOAM531/fP8O3xP/mbFBEpnGOLZDXR73D6QxGOY/ElO76vfw+2XAkTqz
        w3kSheGXG2XUYOgrz5j16R7rnw==
X-Google-Smtp-Source: ABdhPJyVs8uL4JfAJM6teEQLGRWubgP5mIejizDNiDtnt96R+c31W82MjetFIVRVBWrWSp/WQJPLIw==
X-Received: by 2002:a17:90a:3002:: with SMTP id g2mr7353479pjb.68.1594173617292;
        Tue, 07 Jul 2020 19:00:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 73sm23957949pfy.24.2020.07.07.19.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 19:00:16 -0700 (PDT)
Date:   Tue, 7 Jul 2020 19:00:15 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <shuah@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: linux-next: manual merge of the seccomp tree with the kselftest
 tree
Message-ID: <202007071858.C097D869BB@keescook>
References: <20200707145720.02636577@canb.auug.org.au>
 <202007070125.ECBAB9E7C3@keescook>
 <18b266d0-a116-7201-6cd8-6e11f809e753@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18b266d0-a116-7201-6cd8-6e11f809e753@linuxfoundation.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 07, 2020 at 01:27:59PM -0600, Shuah Khan wrote:
> On 7/7/20 2:26 AM, Kees Cook wrote:
> > On Tue, Jul 07, 2020 at 02:57:20PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the seccomp tree got a conflict in:
> > > 
> > >    tools/testing/selftests/seccomp/seccomp_bpf.c
> > > 
> > > between commit:
> > > 
> > >    9847d24af95c ("selftests/harness: Refactor XFAIL into SKIP")
> > > 
> > > from the kselftest tree and commits:
> > > 
> > >    aae7d264d68b ("selftests/seccomp: Check for EPOLLHUP for user_notif")
> > >    11b4beaa0d31 ("selftests/seccomp: Make kcmp() less required")
> > >    ef332c970dfa ("selftests/seccomp: Rename user_trap_syscall() to user_notif_syscall()")
> > > 
> > > from the seccomp tree.
> > 
> > Har har -- a collision of my own creation. Yay lots of trees. ;) I'll
> > make this go away; the cause is a harmless cleanup.
> > 
> 
> Thanks Kees. Let me know if I have to do anything.

Yeah, as it turns out, I could only minimize the conflict, and I think
I'll just mention it when I send the seccomp pull request for the v5.9
merge window.

Thanks!

-- 
Kees Cook
