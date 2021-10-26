Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089F643BB6E
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 22:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239146AbhJZUSV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 16:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239123AbhJZUSR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 16:18:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8724BC061745
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 13:15:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id j2so1329802lfg.3
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 13:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=taV1czNtFBk3wgJIw7/elwcYtGkrQv1vUafu2ZhNsNw=;
        b=R6rNCvUkrnv1vcP2u/6l8kZYVcl8Us6A0UDGpJgmU0GhiKJV6Fu69vxQAqAEpQwoC4
         t8/eb+qQ7ewIHBZ5bsMBsQO9qPcGtOuzkHTVycZTh2tH6wkeHGpwy+J8lWWhemlcxtgD
         VGxO/DHJwgoPMtgyy42h7P8f+HL6STQQzF3mbfBDC6LYis3VSIGQWAx8AO55yL38ywIA
         EYQHv3vziEIoCufRqKRc186y7HE01Ie7ioW88F7ZP9x+zgmRQjlT/9GVabJ0TnAN4Bi/
         2ZZVsFo0TVD+AMzK+aBK8bDSbW49D6w3w2KZKpR0U66uF1SL11SomckOm+ot0oXStRyW
         T6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=taV1czNtFBk3wgJIw7/elwcYtGkrQv1vUafu2ZhNsNw=;
        b=7GoFHBvjUSG7Si5qabGJINflIHrJ9AuvckjR3vVEVGgiZh3O8sHopfT9cIK7Soejfs
         nq22jecUQfg1IPdcsGV1+SOXZESklZylbr/sg/fIG4JdI4wdNHagdSv+u3eKb+qAGIPk
         j6iDvGyWOBfycPvko/YVptGutC2maNYkf6ccy0Ls9fVNYrIvnbkVa0z0DoRhvp+nHfM8
         eZ+e95HTSs53ln6QyK3bqggYSSBeTm7TgfSxov1z2g4ECaiKhNtC+pzHfYX9Skv0b5xh
         6SVySXatLgAGOtdfvucOKrvWHrHbIamtcooo9opiQDkub1rMN4i1acibMHu4mCzw1n98
         HP0Q==
X-Gm-Message-State: AOAM532dk+Ff/O2yvpyJwZF5Uli90hVhgwqVWgGq4393+L9PQNrPO63V
        1JhvOVVL8v6sAqjF4kw02P5glg1JA2MDAmYvaVWj7g==
X-Google-Smtp-Source: ABdhPJxL0E0JjLhlZY6NAkx4UDDNDg+c6ySvSb5EuEvuDMYABT71GtWsWOlq/d0/Rd2hiLwsUraha2ciMhUb4C3I0Vg=
X-Received: by 2002:a19:f106:: with SMTP id p6mr16152171lfh.72.1635279351772;
 Tue, 26 Oct 2021 13:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211026162852.6cf2a2aa@canb.auug.org.au> <DM5PR12MB24064E6B3635CF9EDA7696CBB7849@DM5PR12MB2406.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB24064E6B3635CF9EDA7696CBB7849@DM5PR12MB2406.namprd12.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Oct 2021 22:15:39 +0200
Message-ID: <CACRpkdZdb1wOY0cG4LqY8-JkDxpwe2fii262A2QVXEYXrv2vuQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Kartik ." <kkartik@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 26, 2021 at 2:30 PM Prathamesh Shete <pshete@nvidia.com> wrote:

> Fixed following warnings and error.
> Attached the patch that fixes the issue.
> Please help apply the Patch.

I applied the patch!

Yours,
Linus Walleij
