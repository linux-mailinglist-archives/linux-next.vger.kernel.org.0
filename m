Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2626236A138
	for <lists+linux-next@lfdr.de>; Sat, 24 Apr 2021 14:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbhDXMqa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 08:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbhDXMqW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Apr 2021 08:46:22 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D07C061574;
        Sat, 24 Apr 2021 05:45:39 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id d15so7364485ljo.12;
        Sat, 24 Apr 2021 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zNJV8jDZsSD0jAV2pRGqAb0lPiKzqX9unVZbuF/4nZw=;
        b=iAKX2JbY29N7O/cm6IBlySrgEcQ34tJe0KoAQjwAgy7/n89iFWwZFE95FmdtDNcwGD
         C/NI9rCRRWgoRLcPwvic/Wyc3+oGWu8A5huVmRA3ecJxZxuf8V39HKb3uMmOBYCAa0j9
         ln5oxl8RS5iExQnW1nNN8VMHe/iSw7pfS7+0bpOi/2btXPEwucUjkRtP+dZuzyztC2Jv
         OFB/EWgmfkMHnJ7gVmGQQ7O0U0hJ9Bi1eaKvvJ+tJEvmBSDPintXdegyNWU80ld6V43q
         Fk8E2GmujX2Bd6n6WNIVnDebaUFlSIS5g0pRcwF7MM0exfJW4Ehg2/gJxDjFy7iaIxi/
         XNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zNJV8jDZsSD0jAV2pRGqAb0lPiKzqX9unVZbuF/4nZw=;
        b=ODUykuMJy2lxOMBALDqfpUqXvhRypMvsuSLSuEbCo7/zgAOtgzZerYZGqgN+S9TSxW
         l+ysC85WwXOaGA3FbUMP6AlgNLnfKLSPkNQgLYkhHZjPJRlnIaEWMKITc6yhJ+yCdz/n
         +HiRVJeqXRUfhBP8d4rVnfJYCyMoOhhcOijwEYzlNJi5FkMHXQO9/wPhMILH+O36fl/F
         0w0Y9H2UIxPrdsKTbaR4m6Qf5JII2SKMV7XZPRDv7RoW3Je5FHLCo48k35cQ3yI1GGR3
         jayKEj+eSp9WiiHBiMP5dOPvOzgKqveS4tJvLCBCxo95wKBkzW0HCFb9ZTTE0eYOS3Kf
         0qHw==
X-Gm-Message-State: AOAM531rRtHe8pAzxoAERxxZJ7M3znfH5cFxqLMUCg8MkqC0TnQ/uez4
        e5caD1Oaw8hpDSdYaz366zBRJh2x9j4rtzmZxObKX6UC
X-Google-Smtp-Source: ABdhPJxpAR+WBsqvrpXR2+P+ynFAdp29I51GLaD+JfVPpcqs84TyshuukiFdgCbY16tHSt+Ct5TAplaRcik/ac/u4x4=
X-Received: by 2002:a05:651c:1046:: with SMTP id x6mr5738814ljm.121.1619268337905;
 Sat, 24 Apr 2021 05:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210424104715.2793760-1-gregkh@linuxfoundation.org>
 <YIP8c3Bgfz9YfH6A@kroah.com> <CAOMZO5ByYV=g_29vWNPXr6zi6=xQsFVDak2keUPPq01cKg-7_Q@mail.gmail.com>
 <CAOMZO5Bgx1KLP9v0ycHCbeJxE9w9XK5=FJ_08LrjDyXov-O7wQ@mail.gmail.com> <YIQSXncj8WhXwFeR@kroah.com>
In-Reply-To: <YIQSXncj8WhXwFeR@kroah.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 24 Apr 2021 09:45:26 -0300
Message-ID: <CAOMZO5Ar1vsUFTobRQztJaLq+g+DS61O=h_yms67zYLEZg_eQA@mail.gmail.com>
Subject: Re: [PATCH] USB: fix up movement of USB core kerneldoc location
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Greg,

On Sat, Apr 24, 2021 at 9:43 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> Does that produce the same output with the information from those
> functions?  If so, yes, that's fine, I didn't understand the need for
> _usb_header: there at all...

Yes, I looked at the generated HTML and it looks good.

> Can you resend this as a real patch?

Sure, will do.

Regards,

Fabio Estevam
