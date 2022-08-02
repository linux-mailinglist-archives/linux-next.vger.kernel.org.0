Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5531458831C
	for <lists+linux-next@lfdr.de>; Tue,  2 Aug 2022 22:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234725AbiHBU1n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Aug 2022 16:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234672AbiHBU1m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Aug 2022 16:27:42 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA34B1EAC5
        for <linux-next@vger.kernel.org>; Tue,  2 Aug 2022 13:27:40 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id gb36so2353008ejc.10
        for <linux-next@vger.kernel.org>; Tue, 02 Aug 2022 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=lby9lvyugHd82C4d0KaHXp3LJIsW6TZwJseJofssqh0=;
        b=dY4VR24PCrKQgsbFRhU1dAE4OtBv7+g3WLBV6S0FMdma0ru6Hreb2eW7/GMoGlAU2N
         +H3WCgfto09f7rg2xmE2XndfDGLlP1XP9cH6qP0XE5OsnuzLQ6/RGW78tSovVY8cjzqo
         yB9f0OUxFUU+z39N6BBZEGLX0BRV57fefxMM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lby9lvyugHd82C4d0KaHXp3LJIsW6TZwJseJofssqh0=;
        b=zH4vDKLk+DKTB5V0tXeGby/aUqaEmAx+Fy19tycfPeUnNlF4YDphdqXsD6XuFh6YLx
         FDQoR8CzTmeq4ccSlSSbutFZL3aZchja9lZzuFmXHLtj6KuV4JEjb1vPW2OUR4BGD14I
         4mG4T1SZvkKpCMdWFMWloa4gyp+rWW28eMppmRUh2zFkGkbTsVCltV78vKz5zm/8lVG9
         Ua7+BKOjZ97mP2GMogwBxNPxGUYL54NYrYer8En4TJtD4ZSClAckPn7jw7/RafUqwRSx
         zIeoT2+nI4ZX9DLHcHyR+3c8melCsECVjx314QL6GgOCpU63nARRckMCs/HvOBLwQKxQ
         PWWg==
X-Gm-Message-State: ACgBeo16vKZdGV058HhLci56LZtOn91nFaIPlmV/8Zrfcpld5rVHnSlt
        QMZp/0N6yVFp59iBuGIICgKS8QCgzJLz+iDv
X-Google-Smtp-Source: AA6agR65yQMs4nfHsbR4JSCZOkWUHz149hfvPFoumRqayv7kU5BP3D5d3RoWxD+vQ8kbBsIqzFp2mA==
X-Received: by 2002:a17:906:4795:b0:730:a6a0:36f4 with SMTP id cw21-20020a170906479500b00730a6a036f4mr2143990ejc.148.1659472059312;
        Tue, 02 Aug 2022 13:27:39 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id w10-20020a50fa8a000000b0043bdc47803csm8747510edr.30.2022.08.02.13.27.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 13:27:38 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id l22so19233790wrz.7
        for <linux-next@vger.kernel.org>; Tue, 02 Aug 2022 13:27:38 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr13824780wrf.659.1659472057895; Tue, 02
 Aug 2022 13:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220802200649.2122084-1-broonie@kernel.org>
In-Reply-To: <20220802200649.2122084-1-broonie@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 2 Aug 2022 13:27:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2aPq8Zsv-GSfj8Kz_9+MFxmejchoF4LUUY3tOLx3Ntw@mail.gmail.com>
Message-ID: <CAD=FV=X2aPq8Zsv-GSfj8Kz_9+MFxmejchoF4LUUY3tOLx3Ntw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tty tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Greg KH <greg@kroah.com>,
        Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Tue, Aug 2, 2022 at 1:07 PM <broonie@kernel.org> wrote:
>
> Caused by commit
>
>   c474c775716edd46a5 ("tty: serial: qcom-geni-serial: Fix get_clk_div_rate() which otherwise could return a sub-optimal clock rate.")
>
> I have used the tree from 20220727 instead.

Posted a fix: ("tty: serial: qcom-geni-serial: Fix %lu -> %u in print
statements") [1]

[1] https://lore.kernel.org/r/20220802132250.1.Iea061e14157a17e114dbe2eca764568a02d6b889@changeid
