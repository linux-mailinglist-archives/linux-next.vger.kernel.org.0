Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACC72FB17C
	for <lists+linux-next@lfdr.de>; Tue, 19 Jan 2021 07:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbhASGXs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jan 2021 01:23:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbhASGVJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2021 01:21:09 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D4AC061573;
        Mon, 18 Jan 2021 22:20:18 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id g24so20088519edw.9;
        Mon, 18 Jan 2021 22:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zN7GL9dgBP2q22KrliTWCCxzySVH9W5rRcAGz5Qc+HE=;
        b=StV+ttBnN18Wf0nTXq4Z+PaByF7nDUSt3k9444xmciL7AUzBxuJUGZbu324v4vo2Sj
         /+GxpHuwHC6JwfM1mbq8fjVXhbImvOSnnnfkJm8zRT8o/sq5Zx7KhRYClWA/rUr5elYB
         uyC+EwtscUKCTncsrCExuUf34lvpimKU1cRb6Sh1o8QvSsM8zrTnm2uiDuKY7GHmH9Zf
         zVmzg4fWIZ3ExHfEOmSHugzpekY2awdb6HH0EWdJNq4pH/CqSxju8D3s78vVyCCxWWDV
         jBucNN79F7jYOpscBrydSMX9arVy0PiZiJn1IQ9XBexWWSt5UDaMYjaAPQDhEmQK5jwc
         9TCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zN7GL9dgBP2q22KrliTWCCxzySVH9W5rRcAGz5Qc+HE=;
        b=hI0VnkPfl4KjIowb6b0OhP2DaSDPhMyEl50LaKb43kZSpzLpVQ6jbyvu7Zu2kM8x36
         GO2jckqHwKYpS1w40T0xI5H22PbQlG2UMnWWhu9Ya8Bh1xhyPS8HfjFYTw5C9FUnaJSB
         FFNTQzE2UyDGeF9vJOHUMtHryDWKFX3OeT1tdEHsXXfXkKdSPhX+BUniQmmqqv8LNcld
         ciNzvXMe+xgvfZH/An5KnZpLOFl02syowrpGuinEnOsqkMTF9I0QgoRFEKNlM3Svy1kT
         Gbs/muT/XWPUE2QZ+h2x8xfAfz2Kc4U0SFG8UD4e4XgfcW0R+Ku+I/oSVRiYKl+ICyY3
         kmOQ==
X-Gm-Message-State: AOAM530X/jayVkWk9xJ0C3++qObCdPQ8vy8LfxtLGC3jRusVtNIBCWzd
        BoLEVwtcgEHa01rcB9JmG5vijhhNGe2QIzzW+39ZfAf3ss0=
X-Google-Smtp-Source: ABdhPJxpuKMWC1bb5IMA4GaSPmuqanmgCNWWsaojSotKzFjoCauJj02hfRVKcUCwcumuavvm+QQL5t3Qn43Ql7HqTcg=
X-Received: by 2002:a05:6402:2c5:: with SMTP id b5mr2301824edx.258.1611037217108;
 Mon, 18 Jan 2021 22:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20210118084918.356050f3@canb.auug.org.au>
In-Reply-To: <20210118084918.356050f3@canb.auug.org.au>
From:   Zhenzhong Duan <zhenzhong.duan@gmail.com>
Date:   Tue, 19 Jan 2021 14:20:04 +0800
Message-ID: <CAFH1YnOQ-cPrQ=DYzprspYTWOfhiV6rp9VM7ueC=D+0XBTO0MA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the csky tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Guo Ren <ren_guo@c-sky.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 18, 2021 at 5:49 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   8bfb676492da ("csky: Fix a size determination in gpr_get()")
>
> Fixes tag
>
>   Fixes: dcad7854fcce ("sky: switch to ->regset_get()")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'

Sorry for the mistake. Should be
'Fixes: dcad7854fcce ("csky: switch to ->regset_get()")'
not
'Fixes: dcad7854fcce ("sky: switch to ->regset_get()")'

Should I send the patch again with above fix?

Thanks
Zhenzhong
