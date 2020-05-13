Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1796C1D110C
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 13:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732570AbgEMLSn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 May 2020 07:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732494AbgEMLSm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2020 07:18:42 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0B0C061A0C;
        Wed, 13 May 2020 04:18:42 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id m18so13061939otq.9;
        Wed, 13 May 2020 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oE5WugBSvo3pc9Klj8s/jpRZAtxSj2G+F/MbpaTNg1E=;
        b=qIQ/roFGWT0wnElL1u/7xlOD30VWRxKL/kWfMOz9XSiybqFmJCFHj46GoL6JzY1SSz
         Ibd6SFS30RtGUlGxPgwcRyrBR2Y6MHwj9XGjxJwW2xKpE/aR+DaApklL/FdAfzpLQQk0
         0vwFCa+qkbqkzbtM4az9cxsD349mVx63BIJ1xdMWPqqtCsH0/lPJrlDQjeLSLxPa7obg
         hyzXCloM5NaJnAteJMRGODZ0/CPD5Bhfg0Pc5vFX6da30d9FV2X+x6BKJDnUaIC+2AKo
         BRbrnDIX65+B9ScKBqE7TkYUXBYn2ocirCo0PbkOWKYBtq0w0+zXS0KZDJxCYxSGPBRs
         Ugag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=oE5WugBSvo3pc9Klj8s/jpRZAtxSj2G+F/MbpaTNg1E=;
        b=mqg28o5JFk4r7W4xZT45DPIuX/uEdUypUwPsCfNXDSoAY0QdxI+02kUwisYEteOntH
         QvPdmfdSvOjB1XbtrABo0cUc1ySZs7rtVsljFFe8cH1VVrWZ5is8CKpsUtmqb6BYdCbC
         /I0rQeef8dLEG0YeFZRLGnzSfw+V95lLT11Y7G6TbatxLZupJzd9z6Gsq7H5enELAUPL
         dD6G1jCBnJx1oCKwRs0GIDr8XjNFxyKboysHAl9eJF/cEIlPQAxH2SqRSZUrQuVkMGMm
         D2gzpOVCpJGT51lE40JBvm524fUJu1DUZzXH0Bn6wLfT3uQ4M6Diiomx8QzxNzWmijTO
         uswA==
X-Gm-Message-State: AGi0PuZqZ1FomE83IriiVdKQncAOXcC17H7fljIKtyL7gmaWukmAk46p
        KbZUJaxTNXnmodmROTmEUrkwQHo=
X-Google-Smtp-Source: APiQypJNI+0DqoZkxv+pvtTS/nokl0RUPsTqcsL74LIkxNq+hbftSmgsNFZGnInQahLn73kLueZ4Gg==
X-Received: by 2002:a05:6830:3148:: with SMTP id c8mr19784748ots.138.1589368721635;
        Wed, 13 May 2020 04:18:41 -0700 (PDT)
Received: from serve.minyard.net ([47.184.149.130])
        by smtp.gmail.com with ESMTPSA id v9sm5952456oib.56.2020.05.13.04.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 04:18:41 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
        by serve.minyard.net (Postfix) with ESMTPSA id 59923180042;
        Wed, 13 May 2020 11:18:40 +0000 (UTC)
Date:   Wed, 13 May 2020 06:18:39 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Corey Minyard <cminyard@mvista.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the ipmi tree
Message-ID: <20200513111839.GS9902@minyard.net>
Reply-To: minyard@acm.org
References: <20200513103034.4de3c630@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513103034.4de3c630@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 13, 2020 at 10:30:34AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   73d0824e48eb ("char: ipmi: convert to use i2c_new_client_device()")
> 
> is missing a Signed-off-by from its author.

Fixed, thanks.

-corey

> 
> -- 
> Cheers,
> Stephen Rothwell


