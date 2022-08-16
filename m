Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A96E959634E
	for <lists+linux-next@lfdr.de>; Tue, 16 Aug 2022 21:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237305AbiHPTm2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Aug 2022 15:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236448AbiHPTm2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Aug 2022 15:42:28 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7283989816
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 12:42:27 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id y13so20756762ejp.13
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 12:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=j6C9lf7JhzlxE1F6ouy9UeQqCIuaLiW4edqmr70l3os=;
        b=gy/irX4iIF4tgnkELB1IcuP4tGk8YBjcODGsbsYD7RqExJGVHo0bL8amAC7w81Itx8
         OpF7//aWC3ven/odaxRytaZW3ncs7O1Yu47hkFJEsxNY5Z4kL04QnQ89seNTpfsiSHIy
         USuzpUUCp1KxFjMUb6L17sYt1B4yXRFEatTC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=j6C9lf7JhzlxE1F6ouy9UeQqCIuaLiW4edqmr70l3os=;
        b=YJvvLKPLsyDaJpv2GgUOng7scCkQeikVvmLdEH19DGjD7uHOAdWZaP84D2xqvoZwMV
         xe2EqVlYRtDDHr25xpQ2Swbi8jNm3LwAZUZuERv16fdPuAn+d2GsYyi8qTLReYvKeavq
         dwynAT1JODv80ZoBq5uW7AN/ukNwuHLSA2m9KT6b+s8njrDh2yukCL3QYH6eNdNKMEKd
         Zb/7DqMQXuPHdcD3xEgtOs+MS3tELPBNfHcRq2xXK4j9v8HxZILhBemgGpuoONpjmOyf
         UtXgOO3oe2tU7otokr8ya6oC7rd9dWCFp8OiEaRoDm/QWFQgSZ3JVKDxWP5PRLA2jKoG
         Q28g==
X-Gm-Message-State: ACgBeo39wi/XZe4BPBH65YeMeu+uNt43R8EfbTpYqwQYT9IeMZMwVrEL
        cNeDl5fYHSdsS6WdxV4tqYEF0xOV/c/IwVoe9xI=
X-Google-Smtp-Source: AA6agR4xn9vo5FDrY7SqLA32pK7oj2EuWuNGrGvFO/5Qi46rAQLajiNKQ/WcF4YHe4rYGB6h7oUK9Q==
X-Received: by 2002:a17:907:7d8c:b0:731:65f6:1f28 with SMTP id oz12-20020a1709077d8c00b0073165f61f28mr13790312ejc.91.1660678945752;
        Tue, 16 Aug 2022 12:42:25 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id r30-20020a50d69e000000b0043bbc9503ddsm9001886edi.76.2022.08.16.12.42.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 12:42:25 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so1013083wmk.1
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 12:42:25 -0700 (PDT)
X-Received: by 2002:a05:600c:657:b0:3a5:e4e6:ee24 with SMTP id
 p23-20020a05600c065700b003a5e4e6ee24mr71425wmm.68.1660678944697; Tue, 16 Aug
 2022 12:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv2Wof_Z4j8wGYapzngei_NjtnGUomb7y34h4VDjrQDBA@mail.gmail.com>
 <CAHk-=wj=u9+0kitx6Z=efRDrGVu_OSUieenyK4ih=TFjZdyMYQ@mail.gmail.com> <CA+G9fYuLvTmVbyEpU3vrw58QaWfN=Eg8VdrdRei_jmu2Y2OzOg@mail.gmail.com>
In-Reply-To: <CA+G9fYuLvTmVbyEpU3vrw58QaWfN=Eg8VdrdRei_jmu2Y2OzOg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 16 Aug 2022 12:42:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=whxpMiMj0M7rvz-zsd4G+LB=kcUrM-3VPTt5EauER4iyA@mail.gmail.com>
Message-ID: <CAHk-=whxpMiMj0M7rvz-zsd4G+LB=kcUrM-3VPTt5EauER4iyA@mail.gmail.com>
Subject: Re: [next] arm64: kernel BUG at fs/inode.c:622 - Internal error: Oops
 - BUG: 0 - pc : clear_inode
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, regressions@lists.linux.dev,
        lkft-triage@lists.linaro.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 16, 2022 at 12:39 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> This is a physical hardware db410c device.
> Following VIRTIO configs enabled.

Yeah, it's not enough to just enable the VIRTIO support, it actually
needs to run in a virt environment, and with a hypervisor that gets
confused by the virtio changes.

Plus:

> > Do you see the same issue with plain v6.0-rc1?
>
> Nope. I do not notice reported BUG on v6.0-rc1.

Ok, so definitely not related to the google cloud issue we had in rc1.

               Linus
