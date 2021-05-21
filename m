Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10CC538BB8B
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 03:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbhEUB3t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 May 2021 21:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236789AbhEUB3t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 May 2021 21:29:49 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05050C061574;
        Thu, 20 May 2021 18:28:27 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id e11so22023529ljn.13;
        Thu, 20 May 2021 18:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SrcJUNIlA2c/h4q1u3F3wJeheqbYGXHxdCgoYlNSiMM=;
        b=VKJ3BKg/185/WdPwWFHE164edKfWgburJDhQKH97Pp+lZzcQKfCjNYiWyTJcT2k77B
         jD1dFPuJnHHF4tSr+0YbIuaoDGJZ9I0bk8+8b4BwwZmpQ20EZyx7t9VoUTHRbfbg6cCf
         wqk7LZLzR+6ExtNxBxX03bzTCQq1kR46rx8xVJLflRn/uE7+IbxaDdqf+MpCPthvyebS
         wKDdM0Qk+tgauYLQLXkAa36OXNQWetMy5IqmE7va2TkvvfPGyKgZJOMZa28qNEq9WLaQ
         aBF3JNg6LfLnT3eZ8exqpENZHnyFaPieF3d85cibp9OR78gy4Cie/lwXmAkAbmOrapvT
         vi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SrcJUNIlA2c/h4q1u3F3wJeheqbYGXHxdCgoYlNSiMM=;
        b=erg2sfO02aAGGcWoqPfy1cdu9Zo111TOGCyHw88IittrjZ7SGhaA3FlvwwRA2rV2PZ
         PQh2yn5n/6TYm37CRHaO0daO3Y10N7rpI0UjYdOxVani7yPX6//qPyrqr73lR/xzlamW
         cHEgKoZkQaypD0G2DzfpUT15AAMUnDEZ31t3wYHhU6kKTWz7gpYPj4QIYxlXTo881c8Q
         WDf7lAdCmukPFliGMnxd6WhPKJwJUKcUqFAxqwCndZs6Ifftetkz0gIzyxfSILAFjm4K
         7aEzXlBqAVU+uYrqcDHZpJxlC/+JWN7eOIvfT/I6JHoBXJhjmwl7kvdS28QrLc8MUmbZ
         DTQQ==
X-Gm-Message-State: AOAM531YuJf68pt7VnFt+p1WhqROpLyB8ureh+KwM76rTnsPBXDuHUGJ
        rQdul3uwOSGIZeQLugMXNmA4dsWdsed5yILTgGA=
X-Google-Smtp-Source: ABdhPJxG8IZVu/Mx3xZaR6OSP/OrDuwE6+i2uVKRtMkBjLa6VP4ODhmwGNcrf8cJFJEQzHXvHYPny5kmFoJ8ThTMZmA=
X-Received: by 2002:a05:651c:a06:: with SMTP id k6mr4887437ljq.347.1621560505339;
 Thu, 20 May 2021 18:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210426224413.2ce59504@canb.auug.org.au> <YIa3u0RCcOf+tZMu@kroah.com>
 <20210521104014.796734bb@canb.auug.org.au>
In-Reply-To: <20210521104014.796734bb@canb.auug.org.au>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 20 May 2021 22:28:14 -0300
Message-ID: <CAOMZO5CD_xhc0L1LC+jZypXASkPu_kFv6U5WRL5kJTFRE8oTnA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the usb tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, May 20, 2021 at 9:40 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> I am still seeing this warning.

I will submit a fix for this warning.

Thanks
