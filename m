Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8FC305BCE
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 13:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236152AbhA0Mnx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 07:43:53 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:43704 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237322AbhA0Mli (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 07:41:38 -0500
Received: by mail-wr1-f54.google.com with SMTP id z6so1693058wrq.10;
        Wed, 27 Jan 2021 04:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FdHA1Urira+I5+/hI36pjiepXRWqO715jTOp3A2Pf6U=;
        b=rAR24+vF9392CQDbimcKlvMIAsDfhQ2CLZYC2R9lBjxUEyJFqMwvTnCq51o+ph0ltM
         BsFpRRXOYJ8YQAd/Bneg3Zx9ug7kkzbn4cDa7WtOPvLsUPrNZOsCKnNhsvBu4SdL7eIn
         +0e6XxrT1K+LooNgueFC2fVua6OpABryKUkU6yjkXQMUdgN+pgoCjkdpfxRKLeY9hTF1
         qb4Z/b/lichptG36UmA7LHVcycuic3W2X/zX8ff2wIiGQLsTs4alDDL8kKdMV4WUW5Wr
         osBp2h9HOResVNtJCI/s03YbaJiRIoGf83SgrhRv2S/hVPZwkHyhw4A6c9LDf8wUor3Y
         U55A==
X-Gm-Message-State: AOAM531ucZi7oCswQJooZaNc6x2zS5TGnt/ask3rnshWKj75KMSRccMj
        IxXWY0A/h17DmHKqiqjP3BI=
X-Google-Smtp-Source: ABdhPJzHJd0hytwhhGmGna8ZGwiriRrdLlc2/HmxG2k1CPFLekdtXvHTviNiOPPiIAv30djB3k2DFQ==
X-Received: by 2002:a5d:524a:: with SMTP id k10mr11086635wrc.394.1611751256883;
        Wed, 27 Jan 2021 04:40:56 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id g14sm3016317wru.45.2021.01.27.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 04:40:55 -0800 (PST)
Date:   Wed, 27 Jan 2021 13:40:54 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20210127124054.ws7jhnfefqa6vpsw@kozik-lap>
References: <20210127204126.484d8f0a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210127204126.484d8f0a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 27, 2021 at 08:41:26PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Thanks for the message. This should be fixed already.

Best regards,
Krzysztof
