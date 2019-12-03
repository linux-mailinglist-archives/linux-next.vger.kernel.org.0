Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 679B310F82F
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 07:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbfLCG6R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Dec 2019 01:58:17 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43014 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbfLCG6R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Dec 2019 01:58:17 -0500
Received: by mail-wr1-f66.google.com with SMTP id n1so2184523wra.10;
        Mon, 02 Dec 2019 22:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zF74IGfN8k4r/66rDN9iUDHqi54WQbWfKDWkqcaxjZw=;
        b=PdZ4+lTwKLhTadzoIBTD+MAdEKy2PGkrU15xlBIIWitCyv1IYwxpgI4BNaX5WW7Iu3
         R3Bb34YpH513Zgxv+Pui8YnZ3U9hlnFrabHfQnt7AIpOg8tckDYAj/ZkCtSfBaBl1WPb
         7oz1xCuo7Pdu7Dj2p5wy1C8DlL8jyLZqL5DMI7IMnL/m8Mh5Ck0GzH6hxT936JN/n/IJ
         bfjdCSEvrhxWoi4E6jxbST7u01T+YN2iOnlFEKF1a8wHiZBFESivfIBmlHENFJTKNnnx
         UgEdRfPqV08ZBNTdglKXGa/RJOBfw7HR9Sp9JfBnug7GqN+6TwqB1J3IjTmSz2c+5Exx
         Y6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zF74IGfN8k4r/66rDN9iUDHqi54WQbWfKDWkqcaxjZw=;
        b=eC+HNcAR6Ewg0dW+axhxQ8zRnEBlFZCe0CxhTRYllDKJ1+BXvqNNbB6/csJu8qVPqc
         a9DjyanZenFvabKLGhAmzObtxxRflss4AoYLxauem+9Jqfdd2VbVX+mG6TSu9ooj8EZ+
         G29ie0Rfw7eHGvSjDEW11GyWtqqsIDp+tRgCxMq7C49SoYYGkVy2jHG4zhdDAdVH0Wgg
         O45FMHA86oRsd4RdJ6N/iVDH0qmu9JMqZLNKV6PY0gMwmlwzxg/W9gsYoXSbh01chUUG
         6GWFYAAQaEmdhMOpOKBbmBS20QwCgIOyHylGS+d39rcHnf+6EYcQfdWngSQ1+g5d1nZG
         spyg==
X-Gm-Message-State: APjAAAVVogUEDPljY9ZfWlQvVoMDb+B/CJy79TqERAXhCw2+ILmqOaTY
        wFy54OB5OsS3ytgxz9y7cwU=
X-Google-Smtp-Source: APXvYqzDUtSY4j2FaTqaOLrl5xV1xcEZrpY5GUGhDwiA72WNVMfQoHhvDxH5M8QSY5J/ezF6uJMc0Q==
X-Received: by 2002:a5d:5284:: with SMTP id c4mr3141134wrv.376.1575356295012;
        Mon, 02 Dec 2019 22:58:15 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id r15sm1915483wmh.21.2019.12.02.22.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 22:58:14 -0800 (PST)
Date:   Tue, 3 Dec 2019 07:58:12 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Safonov <dima@arista.com>
Subject: Re: linux-next: manual merge of the y2038 tree with the tip tree
Message-ID: <20191203065812.GB115767@gmail.com>
References: <20191127130139.0b16375c@canb.auug.org.au>
 <20191203140259.33291393@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203140259.33291393@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> This is now a conflict between the tip tree and Linus' tree.

This too should be resolved in my latest update of the -next integration 
branch tip:auto-latest.

Thanks,

	Ingo
