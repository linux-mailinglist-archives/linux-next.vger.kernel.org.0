Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9345F1E300D
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 22:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390435AbgEZUca (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 16:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389096AbgEZUca (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 16:32:30 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C81C061A0F;
        Tue, 26 May 2020 13:32:29 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id l21so25288070eji.4;
        Tue, 26 May 2020 13:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=frTCyEJytMIpMzPgqZ3lqF+pkdQxw1WSjI5Ry5UFq5I=;
        b=IljquMpmJNsQqTFtQAguaOxhoTCWTpYRniOr8MuJ3DoqbydFogfDP9VW+W87BQstsR
         OPBayw0RFE6iKQ/hTP4hyGHOywAU0FnWt++TBwFlvjadyrBZgNlYAOIQFxvplj6b6mtl
         wpORcH+FUq038v382wEk3G+YK2w/TABXGVqSFUVIeo5feLNG8RnB2QVgBDN1NK/V3Del
         2qzVbosAlK0HzoQzjA3jpz0z8VPpDWTJc2vKlNc8inJEwiIYHG4shAR1cFhgZHO2ge5a
         jtKi8rQN/9bUgKv+cz4lgfEl2nw/Ie6fq+1Gl6NyoQhEzmlrZ8rPb2rgw5+guPULhKqe
         fe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=frTCyEJytMIpMzPgqZ3lqF+pkdQxw1WSjI5Ry5UFq5I=;
        b=k6wZ82HLyvOrO2yhX/8TmIXs4yMf8r9O+qXF40okm1Vu2zeXpJowZ5aXFS3o3K2GTh
         y/Vuv0wo2P9mBycbnw5wTHTDXCH/UNtQbjiw3nEBK2YkTStoXursOnjfAN69CNbJemrN
         5W+btoMXXwjd5xqIjc5ghLW8ui0/zQRuP7v0U06Hy9QwZA9QQrFmIV90bM45D6rehXuW
         G/fZSDe0mss5onzfse1l9bIezF4W9DWtEGaKkhI7KGew1+R40uQivXBIwCC+1/RTWBui
         Rl1xEZ85yn0NWlDLOO6sE3sHzv+GoANdmULIwJP43qtx59Esa05ZZhYpizdPkO3UK6Oh
         /uuA==
X-Gm-Message-State: AOAM530btxd9disWGW5nC40f1ssgoitj/zepi2kcPIiTIuF9YOzbNx5y
        inPgXEN0ta4YxFChdVgyGNVkLAAA/t5sJK6cHhw=
X-Google-Smtp-Source: ABdhPJzFPlr2WGlGDBnhC7WsSJMXNzXAUl4NRIgZRMAQF7dmd4WuTEuCuUSuOKDlw1a8WDHUXwvb9/G+7EwF7/tuigY=
X-Received: by 2002:a17:906:7e17:: with SMTP id e23mr2664267ejr.172.1590525148457;
 Tue, 26 May 2020 13:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <5ec9617c.1c69fb81.b979a.bf47@mx.google.com> <ffe2c64c-62ed-9b59-3754-7ede0f0203be@collabora.com>
In-Reply-To: <ffe2c64c-62ed-9b59-3754-7ede0f0203be@collabora.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 26 May 2020 22:32:17 +0200
Message-ID: <CAFBinCC59r-LqSCkVpyjkEr_q+hLQLECDSSiAas+ZF+DoaiJLw@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on meson-sm1-sei610
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-next@vger.kernel.org,
        kernelci-results@groups.io
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 25, 2020 at 10:39 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Please see the bisection report below about a kernel Oops.
>
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
this one is valid indeed and I have sent a fix for it (plus an
unrelated fix): [0]

Also thank you for listening to feedback from a while ago.
This email reminded me to add the Reported-by tag :-)


Martin


[0] https://patchwork.kernel.org/cover/11571203/
