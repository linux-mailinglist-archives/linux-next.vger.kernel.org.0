Return-Path: <linux-next+bounces-8811-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1A1C3013C
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 09:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4D9C1884A4A
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 08:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF34A2264C7;
	Tue,  4 Nov 2025 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8hV9xrf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7DCA41;
	Tue,  4 Nov 2025 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762246119; cv=none; b=bqHRrX+TOn7UrGo7xC0t4ziV80PEQpmfc1A1ryy9aJWWX0mX9xSHh4Y8Ih4O+AsWVrrzuuiR4r65qKyCW57ASq2Ky925YsyUScvstNlMwN2UJoD2CcitdwL5wmg18zl84bjrLvVvUeFlquprXTRL/mH7u7SoVP0a+IGg3qpPfHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762246119; c=relaxed/simple;
	bh=cyaOp4TzuEGnzG2aGAw91JuEsG1zpDPK6rl+pPPfG9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1iu7HfzwusFcY6En9gye6LlCcm3wPwIUaw/249XOFVE+1T44V6gQGTzSTNiCMLtwa7f+OWaVeTbYl73daP0BiYQ987aVQfwbMmQqJD2vVKG//A0wg+NyDd4OI7L0fL+ZaZgE8ds/KkMMjtl9tYqeXaUOwed+jDIiI1K2au5I34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8hV9xrf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662DBC116B1;
	Tue,  4 Nov 2025 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762246119;
	bh=cyaOp4TzuEGnzG2aGAw91JuEsG1zpDPK6rl+pPPfG9c=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C8hV9xrfu+uOtB7DmJSeE/q55XaVF0Pk36O6zzdthG03XOFKc8wGRehQFBtVEynEo
	 wTBvXQTXHh06c13wApCT5allTl0PydpG9tO+k09HCu3l6yoWYA2nC2aup2bD4XuR6C
	 81jxPRAKtUTm94KfU9rbBNXgqVS95ZnYbDhjhv7TigL5+WJuD4GjQ7kwzep4DZaS95
	 9M4a67xaqRxg5Pduy+U2YZp1mJtHAAkowFAv9bN2LEItDeAkZFQVhBxzLVvjnKUbQa
	 tyMNdxWhCzQnCwlfqpPv7Khty9BDl/ttSdzCACHGpt9BMfSdM1M1Ig5gKawJETekla
	 aH4RVcAKAQaLg==
Message-ID: <ec0cb997-099a-475a-9a7e-d3a1cb82b973@kernel.org>
Date: Tue, 4 Nov 2025 09:48:35 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
 Sami Tolvanen <samitolvanen@google.com>, Petr Pavlu <petr.pavlu@suse.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
References: <20251104104827.1de36ea0@canb.auug.org.au>
 <20251104105415.68bfb090@canb.auug.org.au>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <20251104105415.68bfb090@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/11/2025 00.54, Stephen Rothwell wrote:
> Hi all,
> 
> [adding the modules tree contacts]
> 
> On Tue, 4 Nov 2025 10:48:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the pwm tree got a conflict in:
>>
>>   rust/macros/module.rs
>>
>> between commits:
>>
>>   3809d7a89fe5 ("rust: module: use a reference in macros::module::module")
>>   0b24f9740f26 ("rust: module: update the module macro with module parameter support")
>>
>> from the modules tree and commit:
>>
>>   927687809649 ("rust: macros: Add support for 'imports_ns' to module!")
>>
>> from the pwm tree.
>>
>> I followed a supplied resolution from Uwe and Danieli, thanks.  Though I
>> am just wondering (fromfollowing the pattern) if the "&ns" on line 545
>> should be "ns" - though I guess it would fail to build if so?

We missed that non-trivial reference refactor. Sorry about it.

In this case, ns is already a reference so, your guess is correct. It should be:

@@ -348,6 +351,11 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             modinfo.emit("firmware", fw);
         }
     }
+    if let Some(imports) = &info.imports_ns {
+        for ns in imports {
+            modinfo.emit("import_ns", ns);
+        }
+    }

This is when Andreas' patch is applied before Michal's. To be clear, here's what
I mean:

HEAD -> rust: macros: Add support for 'imports_ns' to module!
rust: module: use a reference in macros::module::module

>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc rust/macros/module.rs
>> index d62e9c1e2a89,408cd1154875..000000000000
>> --- a/rust/macros/module.rs
>> +++ b/rust/macros/module.rs
>> @@@ -205,50 -98,7 +205,51 @@@ struct ModuleInfo 
>>       description: Option<String>,
>>       alias: Option<Vec<String>>,
>>       firmware: Option<Vec<String>>,
>> +     imports_ns: Option<Vec<String>>,
>>  +    params: Option<Vec<Parameter>>,
>>  +}
>>  +
>>  +#[derive(Debug)]
>>  +struct Parameter {
>>  +    name: String,
>>  +    ptype: String,
>>  +    default: String,
>>  +    description: String,
>>  +}
>>  +
>>  +fn expect_params(it: &mut token_stream::IntoIter) -> Vec<Parameter> {
>>  +    let params = expect_group(it);
>>  +    assert_eq!(params.delimiter(), Delimiter::Brace);
>>  +    let mut it = params.stream().into_iter();
>>  +    let mut parsed = Vec::new();
>>  +
>>  +    loop {
>>  +        let param_name = match it.next() {
>>  +            Some(TokenTree::Ident(ident)) => ident.to_string(),
>>  +            Some(_) => panic!("Expected Ident or end"),
>>  +            None => break,
>>  +        };
>>  +
>>  +        assert_eq!(expect_punct(&mut it), ':');
>>  +        let param_type = expect_ident(&mut it);
>>  +        let group = expect_group(&mut it);
>>  +        assert_eq!(group.delimiter(), Delimiter::Brace);
>>  +        assert_eq!(expect_punct(&mut it), ',');
>>  +
>>  +        let mut param_it = group.stream().into_iter();
>>  +        let param_default = expect_param_default(&mut param_it);
>>  +        let param_description = expect_string_field(&mut param_it, "description");
>>  +        expect_end(&mut param_it);
>>  +
>>  +        parsed.push(Parameter {
>>  +            name: param_name,
>>  +            ptype: param_type,
>>  +            default: param_default,
>>  +            description: param_description,
>>  +        })
>>  +    }
>>  +
>>  +    parsed
>>   }
>>   
>>   impl ModuleInfo {
>> @@@ -263,7 -113,7 +264,8 @@@
>>               "license",
>>               "alias",
>>               "firmware",
>> +             "imports_ns",
>>  +            "params",
>>           ];
>>           const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
>>           let mut seen_keys = Vec::new();
>> @@@ -289,7 -139,7 +291,8 @@@
>>                   "license" => info.license = expect_string_ascii(it),
>>                   "alias" => info.alias = Some(expect_string_array(it)),
>>                   "firmware" => info.firmware = Some(expect_string_array(it)),
>> +                 "imports_ns" => info.imports_ns = Some(expect_string_array(it)),
>>  +                "params" => info.params = Some(expect_params(it)),
>>                   _ => panic!("Unknown key \"{key}\". Valid keys are: {EXPECTED_KEYS:?}."),
>>               }
>>   
>> @@@ -329,25 -179,30 +332,30 @@@ pub(crate) fn module(ts: TokenStream) -
>>       // Rust does not allow hyphens in identifiers, use underscore instead.
>>       let ident = info.name.replace('-', "_");
>>       let mut modinfo = ModInfoBuilder::new(ident.as_ref());
>>  -    if let Some(authors) = info.authors {
>>  +    if let Some(authors) = &info.authors {
>>           for author in authors {
>>  -            modinfo.emit("author", &author);
>>  +            modinfo.emit("author", author);
>>           }
>>       }
>>  -    if let Some(description) = info.description {
>>  -        modinfo.emit("description", &description);
>>  +    if let Some(description) = &info.description {
>>  +        modinfo.emit("description", description);
>>       }
>>       modinfo.emit("license", &info.license);
>>  -    if let Some(aliases) = info.alias {
>>  +    if let Some(aliases) = &info.alias {
>>           for alias in aliases {
>>  -            modinfo.emit("alias", &alias);
>>  +            modinfo.emit("alias", alias);
>>           }
>>       }
>>  -    if let Some(firmware) = info.firmware {
>>  +    if let Some(firmware) = &info.firmware {
>>           for fw in firmware {
>>  -            modinfo.emit("firmware", &fw);
>>  +            modinfo.emit("firmware", fw);
>>           }
>>       }
>>  -    if let Some(imports) = info.imports_ns {
>> ++    if let Some(imports) = &info.imports_ns {
>> +         for ns in imports {
>> +             modinfo.emit("import_ns", &ns);

Please, drop the '&'

+            modinfo.emit("import_ns", ns);


>> +         }
>> +     }


>>   
>>       // Built-in modules also export the `file` modinfo string.
>>       let file =
> 

