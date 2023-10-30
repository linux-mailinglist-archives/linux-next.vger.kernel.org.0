Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9E47DC18A
	for <lists+linux-next@lfdr.de>; Mon, 30 Oct 2023 22:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbjJ3VFR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Oct 2023 17:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbjJ3VFQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Oct 2023 17:05:16 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45BFE1
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 14:05:14 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cc252cbde2so21071375ad.0
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 14:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698699914; x=1699304714; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J/ro39ZjXP8/N78CP33HQRu7jBM2jc66Dx/aqxCDkow=;
        b=yNb2sQJSa3cI8AsqaWI3Mrv+uTPvMgLn41PACq9M4XHIHX5Av6cI3Q1axxst85oiiy
         sKqvnZsVeSb7z1TyqesaT7boFrfb68me94Ri9ajdl8Tl4VVliq70kINgSVEZ5lYbLej+
         QNdSkkNjiH33g4c4QpsNwLEiijjATGzq4VygpyWEktbOSCSAuH21hmgYeOuXgLg7JBuJ
         hlmdL2vVPyanck/Q0aOFdF1ZMlmYQmcaEJJPUH8RbFNLfQJwuOkHXavtiOOXKLQ6XSK2
         311ZxVezEp8T+frJ6FNPmNx9NV/jOLAOmoSQYsgWttqyG6f9uHTIsXS+T+2n4wiwX5xy
         XNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698699914; x=1699304714;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/ro39ZjXP8/N78CP33HQRu7jBM2jc66Dx/aqxCDkow=;
        b=YsbJiQOeZQqZrf4AJS1YmzrBp+8BAWFJBA0EHLfK68H8DjX7bko7JC3dHjAhpv9ISp
         gW+4aCBXw+o3XFYvbHiZ4mc6WM7+n01NWd3Dq8e9YQA3M6yTkRvFJ4YpUIxEray5xdgh
         5gtRxl7IOmwllkiqjEuMHMKvx1RlxV5I1SSsbhuq98NTowgoJ5By3MPcffyba/2Dkdm9
         5Ixc5AXE+VG5xFqzaO6J/wn5b8ykt87XLpE1zVAEtQscKP+6hSDnxTftmCEereYoPRKe
         IstJb1REeaHb7MBk3laOPbWzNm0yLTmHPmQrB929K2BnNH+HZfv7QfAzlMJb9kQMIeEk
         p2kg==
X-Gm-Message-State: AOJu0YzzVUvgAW/AOpHnqatQR3tfkZF5YzXoi/MTk+81FqlMCTl+3mX3
        ut2elkiHyomDI/iSw9WxIXjkZ+r0Bho=
X-Google-Smtp-Source: AGHT+IGz83OREeKaWujSJspphjF2KmSJNNXI/EohopzNL13Ec4YlnBVRNnbTbb4QwnzljOjGofBO2NtSs5E=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:efcc:b0:1cc:2bd6:b54a with SMTP id
 ja12-20020a170902efcc00b001cc2bd6b54amr157500plb.10.1698699914172; Mon, 30
 Oct 2023 14:05:14 -0700 (PDT)
Date:   Mon, 30 Oct 2023 14:05:12 -0700
In-Reply-To: <20231031073705.512dab4b@canb.auug.org.au>
Mime-Version: 1.0
References: <20231030134806.24510492@canb.auug.org.au> <20231030-ignorant-liebschaft-6d603ab43494@brauner>
 <3ed75fa4-6b49-4fd2-a907-8619ca19a8b8@redhat.com> <20231031073705.512dab4b@canb.auug.org.au>
Message-ID: <ZUAaiA0-FNRNy7wJ@google.com>
Subject: Re: linux-next: build failure after merge of the kvm-x86 tree
From:   Sean Christopherson <seanjc@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Christian Brauner <brauner@kernel.org>,
        Ackerley Tng <ackerleytng@google.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Michael Roth <michael.roth@amd.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 31, 2023, Stephen Rothwell wrote:
> Hi Paolo,
> 
> On Mon, 30 Oct 2023 12:27:07 +0100 Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 10/30/23 11:05, Christian Brauner wrote:
> > > 
> > > @Paolo and @Sean, does that make sense and is the series for v6.7 or
> > > just already in -next for v6.8?  
> > 
> > It's for 6.8.
> 
> Then it should not be in linux-next yet. :-(

That's my bad, I wanted to get the guest_memfd code exposure asap and jumped the
gun.  I'll yank the branch out kvm-x86/next.

I assume -rc1 is when the floodgates "officially" open again?
