Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F05674339
	for <lists+linux-next@lfdr.de>; Thu, 19 Jan 2023 20:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjAST7G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Jan 2023 14:59:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjAST7F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Jan 2023 14:59:05 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FB08F6CD
        for <linux-next@vger.kernel.org>; Thu, 19 Jan 2023 11:59:04 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so6051193pjq.0
        for <linux-next@vger.kernel.org>; Thu, 19 Jan 2023 11:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5RC0JCDgYdUsroIywgc8XQU1Tu7uE+FKQQ2XWStWtM=;
        b=pvzqvPdvRSqyyw4q0wPE6WsHR4Ylo3jfuVPJWlVPNXr7SLPiOQCwjgXWS7DO48szCL
         /vr+E/U7X2EknHt902weBcPyG1PQE8JR5/a6fqWTYt2jTC1HmAgRdNOkDB78wWHIGutd
         bK+HImhq6wljNHYpXj44F9fcogCm1NCexIHgFnW8Q9vrphCzQ4Up3Moy00Bhj0QNvv4F
         uJje7FniU26UeiSrhDYjGcbPhR3tVplG5XS4my720LmwGZFpfVQEhgwLPaSaU/qCXRxM
         eqtUnClaOs9ZO4CWsIMHfq3BTA+9VLTp1Hg/A/Ne1vYAMHh5rVcc2p2KO65nmfy3wAnV
         OJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5RC0JCDgYdUsroIywgc8XQU1Tu7uE+FKQQ2XWStWtM=;
        b=2oaivub7fYnnSZL89mLlxB8CBu50pXgd+qVn8GR2P/dcqF/DiAyRxlVHC+oFo0Wf7i
         H+Xm6vL5j8i3Hvir2h7ilafpjEhnjK1le5Tvac2xoqYhYRos7BoAOLfcr3EiBYmecNOK
         jrJLy1tITzCo8x3usvCGVI3TEt8s3UFRnn6Vgep6T7gSllf09KVYIPWxqztuCujGnvUx
         zB7UcBMJ7E/NkHeHn7w5bOXdfoA3p6oAw45eb9BWJodNG0sDhFzFjIl6BraXqGkpVxEM
         OUIX47cEu8dzNEXiCtaq/I015lvp6qGVvkqZfoOpOJJzoxt65TUW3ZIfRvA81fzs7Hcf
         MF/A==
X-Gm-Message-State: AFqh2kpmL8iwJ7wiQ2W3e547alAUMyqJqmpc6+a2Eyy3qm/UPtaMmrcy
        mpSoDPebgz78aK/upGZRonIb+A==
X-Google-Smtp-Source: AMrXdXtQnqp1RBY/LzS1Q5y0HGB9F9nh0x0rQo9naQy9a+bT4Wj1az0Bk+w8g/3QrByKh+zM1CP60A==
X-Received: by 2002:a17:902:f312:b0:194:d5ff:3ae3 with SMTP id c18-20020a170902f31200b00194d5ff3ae3mr26735ple.2.1674158343386;
        Thu, 19 Jan 2023 11:59:03 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id n13-20020a170903110d00b001925ec4664esm25459940plh.172.2023.01.19.11.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 11:59:02 -0800 (PST)
Date:   Thu, 19 Jan 2023 19:58:59 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-next@vger.kernel.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Add kvm-x86 to linux-next
Message-ID: <Y8mhA9NBzAT27sh0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen!

Can you please add

  https://github.com/kvm-x86/linux.git next

to the set of linux-next inputs?  Going forward, it'll be my semi-official tree
for KVM x86 (Paolo and I are still working out exactly how best to juggle x86).

Thanks!
