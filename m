Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 556BD79F8A5
	for <lists+linux-next@lfdr.de>; Thu, 14 Sep 2023 05:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234320AbjINDHt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Sep 2023 23:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbjINDHd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Sep 2023 23:07:33 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB4B1BEA
        for <linux-next@vger.kernel.org>; Wed, 13 Sep 2023 20:07:29 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68fb46f38f9so455607b3a.1
        for <linux-next@vger.kernel.org>; Wed, 13 Sep 2023 20:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694660848; x=1695265648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7eGH5APPxa0doVf3firHzp15wOgwiJS+4ttZaxDWPc=;
        b=IxyscfjLOR4HiTW0cLXezJ3A7e67CB9DvulJffXF82e9QwuG1lwABF7deTJN6UMjnQ
         OSsJvrnYwnGs/5vlzR8qUxQhNmNQlV5Bk890V3CT3cXeVZ8V3XGYpWMDOjzCm2/LH41n
         1KMZ+FZzD48wfvg7vp+9h8bXPOFQTmepymsLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694660848; x=1695265648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7eGH5APPxa0doVf3firHzp15wOgwiJS+4ttZaxDWPc=;
        b=Qr3LyHmHmxVO8gM5l4EFJnTy8//6kMGICObUgf2SwbvjSr37ayxBUSqQR8LFL1AgzC
         FR0syLNcPizV89A/yW38SLro3VD81mFgJXsLheNadFrQAyxocGl6ru2fWxjP6dTKDipW
         1F3YQfC6j4qile0doiohwDOxn0WURqTIuh1D5WSYIq4Bs066/XFUjT0EsPp3ffuYj6CO
         kVD5fPxJXszHwB7xxrsfxiq4bSE1pOfV6NZNGExaL8o63YOt/WUrF7ZqTPmfKzPzKXMf
         7ZnewHSvkAdtrocOQX7Fd96Y7ISOTBHwaRYnuhq73NMtkfu3dmCfm/KhjizpmJjlS6u8
         T7eA==
X-Gm-Message-State: AOJu0YyfDxWYvpilHK+FzfbOGWuIoEK1EiSvldDzRdWyiqq4ZGbOXn8r
        7GUuFStxTrNh5mOadYhmpdVplQ==
X-Google-Smtp-Source: AGHT+IGZmBpLWFu71hGRZBTNm7bOQUcy1Hf9Acib+EXCmVhkU4RTRREIIfolyhMbhfdF6t9RFYnSjA==
X-Received: by 2002:a05:6a00:1505:b0:68f:da2a:6370 with SMTP id q5-20020a056a00150500b0068fda2a6370mr5148176pfu.13.1694660848650;
        Wed, 13 Sep 2023 20:07:28 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v3-20020aa78083000000b00686dd062207sm256805pff.150.2023.09.13.20.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 20:07:27 -0700 (PDT)
Date:   Wed, 13 Sep 2023 20:07:26 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202309132006.3F606460@keescook>
References: <20230914115036.78ee9e94@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914115036.78ee9e94@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 14, 2023 at 11:50:36AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from security/selinux/include/initial_sid_to_string.h:3,
>                  from scripts/selinux/genheaders/genheaders.c:19:
> include/uapi/linux/stddef.h:59:2: error: #endif without #if
>    59 | #endif /* _UAPI_LINUX_STDDEF_H */
>       |  ^~~~~
> 
> Caused by commit
> 
>   366c47121bf6 ("uapi: stddef.h: Fix header guard location")
> 
> I have used the kspp tree from next-20230913 for today.

Agh, thanks. That's what I get for last-minute tweak. All errors are
mine; Alexey is innocent. :)

I'll get it fixed.

-- 
Kees Cook
