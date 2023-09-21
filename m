Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 866A37A9AC4
	for <lists+linux-next@lfdr.de>; Thu, 21 Sep 2023 20:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjIUSs6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Sep 2023 14:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjIUSs6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Sep 2023 14:48:58 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F662EE5BD
        for <linux-next@vger.kernel.org>; Thu, 21 Sep 2023 11:48:52 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-530a6cbbb47so1607220a12.0
        for <linux-next@vger.kernel.org>; Thu, 21 Sep 2023 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695322130; x=1695926930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yoJ9BAqIakkIRBck4+c6D512CvwPivJvBbrFNArEblQ=;
        b=oxLOJRZ4wlD7I4pqxBOzhsSt9GQI1+Eernn/mbu1MpYzdgRlNIMGTrSRMnbj2o2mIl
         U7ZxpmWTuqMdVXo1NqFObBV+sAjG456/jmhRIEB8DBEUy8VPro3KeB8T7bgFqgDNHnHL
         iwrM/U+T00XsmLGiv5MzMFa3dmY3pi9S6UTAq5Xawqj9FwTrDX1gOsc4IT3+H5KdV+b2
         4cH2TVrSl84zVVtxL48HQSkpzyo/5rMGdnzPxJl918Xl5AeOma5k/p7iwQCnI1GmlASc
         d4HLIUls4BpmnODoeVidq1W6+pGQz2PiqoemzJeaqcLVb/xWKUA9eMHor2X8aKO5qqhG
         zR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695322130; x=1695926930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoJ9BAqIakkIRBck4+c6D512CvwPivJvBbrFNArEblQ=;
        b=E+zXCSrbGv4qKNTX+/2i0xBLQtAtIb7Oo5TmeEaprQFS2b9dEx4acdIJ7Os7kBiymm
         vXhPejZ7NlpEkTUavUz4nZBs84WirEtjSF6GZgQkGy05awlGE2k+IBZeSRM+p9QQXCKx
         zyd7pZKFhMZ9cLPP/ctk41mtf0vmWtrny4Wv3PXJ/qBextwgyB3cRKEBR4vW7Yff6oDz
         xfAVeDUKUzsw1W6Fo2LXzMCraSHhse+TJkdMP5onEcK55Wu7XWYZZsQUsnQuWhbWjtXz
         98j9Ao5XoO95EvjhUI/Njm4pdWSdeCAOmv0Kr2lzaFX0+g6zUMFM2dHKVrhz8yMTLP9I
         Rr8g==
X-Gm-Message-State: AOJu0YyOKaFNfuaS5vsbUzCd7iR296/zsf7bI0JwbRdNkTBfvrV6a3xS
        +2GPuxKz0yUK21v7xUTaMaDebKelVlfe96bkPDcrLA==
X-Google-Smtp-Source: AGHT+IG9uHccNQRNfWrPU8ZX/D7XdOZck/6xT2lynqeRJ6EkLfvPB7KBcTTCDBPgEMaA+RDkpFh+bw==
X-Received: by 2002:a17:906:2cc:b0:99e:f3b:2f78 with SMTP id 12-20020a17090602cc00b0099e0f3b2f78mr4284625ejk.67.1695289173321;
        Thu, 21 Sep 2023 02:39:33 -0700 (PDT)
Received: from linaro.org ([86.120.16.169])
        by smtp.gmail.com with ESMTPSA id s4-20020a170906168400b009ad829ed144sm751272ejd.130.2023.09.21.02.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 02:39:32 -0700 (PDT)
Date:   Thu, 21 Sep 2023 12:39:31 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: linux-next: Tree for Sep 12 (drivers/clk/imx/clk-imx8-acm.o)
Message-ID: <ZQwPU23VTdkLVHDR@linaro.org>
References: <20230912152645.0868a96a@canb.auug.org.au>
 <8b77219e-b59e-40f1-96f1-980a0b2debcf@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b77219e-b59e-40f1-96f1-980a0b2debcf@infradead.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 23-09-12 15:28:29, Randy Dunlap wrote:
> 
> 
> On 9/11/23 22:26, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20230911:
> > 
> > New tree: bcachefs
> > 
> > The bcachefs tree gained a semantic conflict against Linus' tree for
> > which I applied a patch.
> > 
> > The wireless-next tree gaind a conflict against the wireless tree.
> > 
> > Non-merge commits (relative to Linus' tree): 4095
> >  1552 files changed, 346893 insertions(+), 22945 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> 
> on arm64:
> 
> aarch64-linux-ld: drivers/clk/imx/clk-imx8-acm.o: in function `imx8_acm_clk_probe':
> clk-imx8-acm.c:(.text+0x3d0): undefined reference to `imx_check_clk_hws'
> 
> when
> CONFIG_CLK_IMX8QXP=y
> CONFIG_MXC_CLK=m
> 
> Should CLK_IMX8QXP select MXC_CLK?
> I'll leave that patch up to the maintainers.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for reporting this.

Sent a patch for it:
https://lore.kernel.org/all/20230921093647.3901752-1-abel.vesa@linaro.org/

> -- 
> ~Randy
