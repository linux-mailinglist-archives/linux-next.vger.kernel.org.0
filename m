Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2783767EDAC
	for <lists+linux-next@lfdr.de>; Fri, 27 Jan 2023 19:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233808AbjA0SjV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Jan 2023 13:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233775AbjA0SjU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Jan 2023 13:39:20 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E11C012F2F
        for <linux-next@vger.kernel.org>; Fri, 27 Jan 2023 10:39:09 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id w6-20020a17090ac98600b0022c58cc7a18so1073250pjt.1
        for <linux-next@vger.kernel.org>; Fri, 27 Jan 2023 10:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nrjxXNdK4I+dKRJl+RazyEkZMnW15ppGiBRRJzwAjlI=;
        b=M2CZG0TsCW2EfMEir+0n0tq6W7MFgvZGhrib8KUa1MaqPIq3z5mkkKpsq27u8R1/s+
         BsJ8LiG+W15gvEMmtXGpUQOGoeAK7kFrWCS+n5BvpTOAKLo9RybRhBnel3EXxzvU9ED4
         gpkSFU1Q62myy3SfHnvEpx08R6r1lxOZHNMjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrjxXNdK4I+dKRJl+RazyEkZMnW15ppGiBRRJzwAjlI=;
        b=byFL7Uhaohx2v82tODNzdx5rwK6IuTyktYT0NtBqlBa01CJjtDm/WP+oc5DmxmUup/
         IUyyxAifa1qkhTZWocdERMFuATcRq3zqobViqFPhbPEhar34baAkeqVq+x6gnVQ5ENPG
         V6Zt9xkEkJGvyPiHcTaY2XBU8dVLPd64+AcYdKROmVbvsvUpsT78El8Q2X8I5q+obwJ/
         On4BjrGHg2t5fOD4MWV1J/RpKz8Om3zspeWMUaG5EQMkh6t7PC+beqgsj+bUUhBWyXzy
         cRsFp+beKwMKnYu3lIGYssFgGrtXkqmGvLR8BPB+VLqUR/MUq1KYeMQaOjwumWsJB2Ha
         m/EA==
X-Gm-Message-State: AFqh2kpZpwaG1dlcyLOgWW7L/F2vK+SOkhLFr2ZmWgKNC7fpnG9lzaBN
        NR6+7O8ShaSDknGxZcg9RMcUAEnvR4nU64eZ
X-Google-Smtp-Source: AMrXdXtPXtXIzrdadZKq6vmQXDs0rCcf4OFWXSTd+Fo+rccWx2CbqlOGRPnsBOn3l8Fz8X1aaaB7Ow==
X-Received: by 2002:a17:902:6a89:b0:194:88a3:6e28 with SMTP id n9-20020a1709026a8900b0019488a36e28mr38669680plk.51.1674844748988;
        Fri, 27 Jan 2023 10:39:08 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902ce8800b0018725c2fc46sm3146551plg.303.2023.01.27.10.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:39:08 -0800 (PST)
Date:   Fri, 27 Jan 2023 10:39:07 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kspp tree with the tty tree
Message-ID: <202301271038.8790DBA2AE@keescook>
References: <20230127155753.1f9b9517@canb.auug.org.au>
 <Y9N3GNBKzOKuSOMJ@kroah.com>
 <82cfbb3e-cb2c-199c-8833-35498ce894e2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82cfbb3e-cb2c-199c-8833-35498ce894e2@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 27, 2023 at 08:12:46AM +0100, Jiri Slaby wrote:
> On 27. 01. 23, 8:02, Greg KH wrote:
> > On Fri, Jan 27, 2023 at 03:57:53PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the kspp tree got a conflict in:
> > > 
> > >    drivers/tty/vt/vt.c
> > > 
> > > between commit:
> > > 
> > >    feb36abbedea ("tty: vt: remove struct uni_screen")
> > > 
> > > from the tty tree and commit:
> > > 
> > >    19c30ead3938 ("vt: Replace 0-length array with flexible array")
> > > 
> > > from the kspp tree.
> > 
> > Kees, I was waiting for a new version of your 0-length patch before
> > applying it as I thought there were review comments on it.  So you
> > should probably drop it from your tree or resend it so I can merge it
> > into the tty tree if it's acceptable.
> 
> feb36abbedea removes the array completely, so obsoletes 19c30ead3938.

Yup, looks great. I've dropped the patch now.

-- 
Kees Cook
