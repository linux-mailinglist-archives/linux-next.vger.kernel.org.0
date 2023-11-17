Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A4B7EF6CB
	for <lists+linux-next@lfdr.de>; Fri, 17 Nov 2023 18:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346135AbjKQRMx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Nov 2023 12:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232105AbjKQRMw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Nov 2023 12:12:52 -0500
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B63910C6
        for <linux-next@vger.kernel.org>; Fri, 17 Nov 2023 09:12:48 -0800 (PST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1ef36a04931so1175075fac.2
        for <linux-next@vger.kernel.org>; Fri, 17 Nov 2023 09:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700241167; x=1700845967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/hoNZwah8AjVjd5/pBBVUbPTzEhp3jSCj9zR0qy2e4=;
        b=GBnFo86C2MwYJwwdulrzBxjkPIjYEWNs/Pw34ZMv5CeqKPUVLW9XpWdUaFUda8lHKm
         7sW8Z49wtDkqJ1GLwkUb6uTxD1uQ+3VDNjk+t09Jj/FnNF6NHerzCvyxRi/qCe+/bg4X
         epRIhDYVoMqsPIRjP9lxB0gK5eZxwYTtJxaPaWVweymuhEembLfRL+ioOe+JvhJtUESw
         b2csBPhqqGSPRnV3jZOds6eXYX0gDy9xStt9g/EkW2nGIBrjQjryJKGxEqIjyi7XY0Qz
         IAdaelAuVJlYdDBZQL8fHeppnZkFlmXgiEKNsRwvKqvfM5adCnCK6EE3RP2nKRxEpacz
         8Y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700241167; x=1700845967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/hoNZwah8AjVjd5/pBBVUbPTzEhp3jSCj9zR0qy2e4=;
        b=P3KXjm3N1s2O2oJZXEtFOqkYsjGtRUO7gBeGcgGV/LYKQzsDv+91m/icGSk8bIz5Go
         5CXQaayhVN/H6Jxv9/QjZduCVBnNsNDl2SrZCbT58ZZes0sfQJs+HPI8gCJabENgt7vK
         hGobQvtjdLa8vHA345+HVEnVsymHnRaOHXqa04sOJY/sdRjNiDniMuxnj9IKBeT3wVLF
         JKQBezQIfghs/70uT9l8yzEe2+NTOQK99ByhWpE1GIJ/H6VGLBbf6M7OPSuXxzUJO6I9
         QVzM6kLToB+RS7ZPesHdNeCndrVjmmri2t49yL/u9pH1mFQqn5dmP4fw2+aJilLRtNPT
         6+6A==
X-Gm-Message-State: AOJu0YxyIfwceGuD/X069cOXGfs31onLstJW0TmwzF+TPOzZuQmleHYU
        ZPwiMr1q2LDEbwnAf6QaJcipgg==
X-Google-Smtp-Source: AGHT+IGZa62vapzDx4pgL5oXuVfeSgvxyZs/DOL/6iahwpimVnUoBkONoUtxcaOA8eIG11XXmAro9A==
X-Received: by 2002:a05:6870:ff89:b0:1f0:36b6:ef25 with SMTP id qp9-20020a056870ff8900b001f036b6ef25mr20556215oab.23.1700241167452;
        Fri, 17 Nov 2023 09:12:47 -0800 (PST)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id an41-20020a056871b1a900b001eb79fedbb1sm331092oac.17.2023.11.17.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 09:12:47 -0800 (PST)
Date:   Fri, 17 Nov 2023 12:12:45 -0500
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for Nov 15 (RV32:
 arch/riscv/kernel/tests/module_test/test_uleb128.S)
Message-ID: <ZVefDTKIeGa+ts3f@ghost>
References: <20231115122752.6b12654a@canb.auug.org.au>
 <1d7c71ee-5742-4df4-b8ef-a2aea0a624eb@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d7c71ee-5742-4df4-b8ef-a2aea0a624eb@infradead.org>
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 15, 2023 at 01:01:24PM -0800, Randy Dunlap wrote:
> 
> 
> On 11/14/23 17:27, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20231114:
> > 
> 
> (using gcc 13.2.0 from kernel.org)
> 
> on riscv 32-bit:
> 
> arch/riscv/kernel/tests/module_test/test_uleb128.S: Assembler messages:
> arch/riscv/kernel/tests/module_test/test_uleb128.S:9: Error: unrecognized opcode `ld a0,second'
> arch/riscv/kernel/tests/module_test/test_uleb128.S:15: Error: unrecognized opcode `ld a0,fourth'
> riscv32-linux-ld: cannot find arch/riscv/kernel/tests/module_test/test_uleb128.o: No such file or directory
> 
> 
> Full randconfig file is attached.
> 
> Is this a toolchain problem?
> 
> thanks.
> -- 
> ~Randy

I had an assumption when writing this code that uleb128 was only
supported on rv64 toolchains. Since it appears that there do exist rv32
toolchains with uleb128 support I will modify this test to be supported
on rv32 platforms.

The config AS_HAS_ULEB128 in arch/riscv/kernel/tests/Kconfig.debug
should be auto-set to N if the toolchain does not support ULEB128 even though
the randconfig has CONFIG_AS_HAS_ULEB128=y.

There are a couple of sparse warnings in this series that I will fix up
and send out in a new series with this fix.

- Charlie

