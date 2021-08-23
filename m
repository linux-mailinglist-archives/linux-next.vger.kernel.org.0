Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5503F4DB3
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 17:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhHWPsY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 11:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbhHWPsY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 11:48:24 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12A4C061575
        for <linux-next@vger.kernel.org>; Mon, 23 Aug 2021 08:47:41 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id x10-20020a056830408a00b004f26cead745so37483743ott.10
        for <linux-next@vger.kernel.org>; Mon, 23 Aug 2021 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=PGY5MBppH3y2dxCQafsws1QXF+6s7GZeWgwaVV7a2w8=;
        b=hCUPx4nXZdMWg5cJiOC37tWLMG0xQBb5x5MZ7Y5tyg9m4z8++m0vSClokdrSp/bKNk
         4zoKdmuFkg+tIaJY69ToL+vbT7fO92N14gUB+IbHFJBRJkPbxWXFKXj7j/HatFZD5Gyg
         L9AkZssnzKbk6Ym4vDN4MGOpxBCqEqkAsQf2OWt9bCFrn9LgDNfdiCaglyYrhg4FLk+Z
         5BhXVpzOF1KPJcXjim6AMhvXVDuo3Z4J8G4PUHcZiVkAnsYk4JBV3LezdErukaXCJoIp
         y1JGgIf/OkmpWQpNpi9i9qVDh6GQog6+aGwZWLXbyGnjk+CxBiRVbSCo79mh213fFN8M
         /Vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=PGY5MBppH3y2dxCQafsws1QXF+6s7GZeWgwaVV7a2w8=;
        b=GlNkcLDZlvu1Qbt6x8Vyx2yXAtxzLtQo8B2b031o6Dx2p+K4IFsKDy6HTDWnL6MxRk
         zDIWgZP4EefuTVXJGjOolmYMm6YL4C0Q4B7Zr9Xy9Mckk4JcWkLcZ02LrGSfM2yLXfFq
         ObuJoEzROeZj+m3m9lqYO98jC6ZhvrunZ4gWcX0kXoh/UHzA9rJ7JywW/UhmFqb1Amda
         AZNUoaIc2y+XrhWTR7VnQf/8QDBXZfK8Vpx0J6owdSk9n7fAskgpw6/ihE4YxK3OMIg5
         pljP00u97GRxadv8I9pqHEKxOxTZw10HqsOgjCVQU01QG/at3ZoxKY5q9CKQ3SGLsucF
         NpRw==
X-Gm-Message-State: AOAM532Za8ZBA6DHjKoBi5cyiHoQqygXe1gktg5/OgkzoL3pDi9usdv2
        UCOQs5mktM9H3dV8TIxOwus/bdb9UQQ=
X-Google-Smtp-Source: ABdhPJyXL5bJJtzNlpk+SMXpAzbYkBgkgIQSF82ODS6p8hB+pzr+Uzx596s2HC+lLQtC8eeYlZGjyw==
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr27893346otn.54.1629733660721;
        Mon, 23 Aug 2021 08:47:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m25sm3990837otp.41.2021.08.23.08.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 08:47:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Notable build failures in next-20210823
Message-ID: <291c0a6a-5285-0b63-21cd-f6aaff4e6727@roeck-us.net>
Date:   Mon, 23 Aug 2021 08:47:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Seen in next-20210823:

Building x86_64:allyesconfig ... failed

drivers/gpu/drm/i915/i915_module.c:50:11: error:
	positional initialization of field in 'struct' declared with 'designated_init' attribute

This only happens with CONFIG_GCC_PLUGIN_RANDSTRUCT=y.

---
Building arm64:defconfig ... failed

drivers/gpu/drm/mediatek/mtk_disp_aal.c: In function 'mtk_aal_config':
drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:47: error: 'priv' undeclared


I don't usually report those, but thought it is worthwhile because the first error
isn't seen with stock gcc on Ubuntu (it doesn't enable gcc plugins), and the second
error was introduced by commit e2b44fa97cb8f ("Merge remote-tracking branch
'drm/drm-next"), suggesting a bad merge resolution (?).

Guenter
