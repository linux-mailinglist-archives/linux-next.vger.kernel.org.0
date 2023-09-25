Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718BE7ACD8A
	for <lists+linux-next@lfdr.de>; Mon, 25 Sep 2023 03:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbjIYBSm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Sep 2023 21:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjIYBSl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Sep 2023 21:18:41 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED421EE
        for <linux-next@vger.kernel.org>; Sun, 24 Sep 2023 18:18:34 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so4907586b3a.3
        for <linux-next@vger.kernel.org>; Sun, 24 Sep 2023 18:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695604714; x=1696209514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9DU462jzu0KSSUhuGCGA7DV9qo0R9Jblrk/4+b+Zma0=;
        b=S43V/sgk4uFDQ1qU+bJiP+aoGrYczLUQK8n9G80IVrvUprhG1XbFJ896rEAnRyJ5wu
         pQrEM6WvJ/ZsHP/bWKPLQOypiA8rg6OOAG1WiblaJI1JhDzCSNaQ4jaheM6E41HH/VWS
         sOXlNtLcMP5UDNTBjdVdIv4Bg7gfqb4Rv2+ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695604714; x=1696209514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DU462jzu0KSSUhuGCGA7DV9qo0R9Jblrk/4+b+Zma0=;
        b=Q1zByJ2vOsMiGDM9ub6SVqrRx+ztGTm0JOH56OIGQAnUKdBTlnPX8hECZdEhEkWEJP
         WJeGtVVmqSpeU0QG3/nonl0AhQ6XbU86Z+UlHy7ePuf+XBU+yYGQWWpksdOsmbV3f2xY
         P8/QAySV6sAVgFQ3qPSHyIWLAXVFYllqTlwEqcor/owC93/GF+vgaFBbAq0o5eZkUdeL
         rVfL0AGz5ObiqER5RsSPp8dyrK/SUeYW3dpiq0T2UpWOoyqefMQYMmf40z2yjxprMbCu
         lksJydBi10JXYX45rLinlCB9APtLLw71to6GLluPd2Tklvtbb59p2UDl30Se3Zx2H1yW
         gIbA==
X-Gm-Message-State: AOJu0YydhgT/So6af7tN8j1DUf/42nmBLc9PGYXwz9LeNvHm0ZEUjziB
        VR9HnvScgxxINfuRFZSehyj5r4v3dSvNlfe0qAw=
X-Google-Smtp-Source: AGHT+IE43Znl4JMWvt1Sa+09y9ZCuxcI1ZEW+xSvOE2VOYQ6szobgNYlZM4v0M1FLtM3mFR/8AsmbQ==
X-Received: by 2002:a05:6a20:9383:b0:15a:2c0b:6c73 with SMTP id x3-20020a056a20938300b0015a2c0b6c73mr7171586pzh.12.1695604714203;
        Sun, 24 Sep 2023 18:18:34 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001c3cbedbc47sm7469161pld.6.2023.09.24.18.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 18:18:33 -0700 (PDT)
Date:   Sun, 24 Sep 2023 18:18:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the execve tree
Message-ID: <202309241818.2F77ADE18@keescook>
References: <20230925081510.6dacf35e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925081510.6dacf35e@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 25, 2023 at 08:15:10AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   d11362467939 ("elf, uapi: Remove struct tag 'dynamic'")
> 
> is missing a Signed-off-by from its committer.

Oops! Thanks; fixed.

-- 
Kees Cook
